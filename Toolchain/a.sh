#! /bin/bash
#一般只修改KD,KERNEL值就可以了，其他几乎可不动。
#export KD=xxxxx_defconfig
#export KD=vendor/xxxxx_defconfig



echo "           "
echo "           "
echo "你设置的内核配置文件为$KD,并打印在kernel-defconfig.log，使用google_gcc-4.9-main编译内核，图形化配置内核"
echo "           "
echo "           "



#一些解释，必看。
#可在终端中直接指定KD，export KD=xxxxx_defconfig 或export KD=vendor/xxxxx_defconfig然后直接运行此脚本即可编译内核，而不必每次都来修改KD值，特别是想要用多个编译器编译时，省掉些麻烦。当然来直接修改也可以。

#手机的内核配置文件(内核配置文件KERNEL_DEFCONFIG简称KD），一般在内核源码目录下的arch/arm64/configs或arch/arm64/configs/vendor下，一般为机型代号，高通骁龙处理器代号啥的，比如mi5 的为gemini_defconfig,一加8系列为kona_pref_defconfig,按实际情况修改
#KD可取的值(内核配置文件KERNEL_DEFCONFIG简称KD） xxxxx_defconfig, vendor/xxxxx_defconfig

#export KD=xxxxx_defconfig
#export KD=vendor/xxxxx_defconfig


#内核产品的格式类型通常为Image或 Image.gz-dtb，Image.gz等，默认Image
#export KERNEL=Image


echo "           "
echo "设置编译环境中....."
echo "           "
#env 设置编译环境
#clang版本11 , binutils版本2.27
export ARCH=arm64
export SUBARCH=arm64
#export PATH="/root/Toolchain/google_gcc-4.9/bin:$PATH"
#全新的google gcc-4.9,编译器的配置完全和x86上的google gcc-4.9几乎一样，64位和32为gcc安装的路径分开避免不必要的问题，以前的是安装在一起的，比如这样PATH="/root/Toolchain/google_gcc-4.9/bin:$PATH" 虽然设置变量方便了，但64和32位gcc安装路径一样会导致共享库，公共文件覆盖啥的。且以前的编译器配置只能说可以用，推荐使用google_gcc-4.9-main。配合aosp clang使用的脚本都使用了gcc 4.9的PATH="/root/Toolchain/google_gcc-4.9/bin:$PATH"，脚本太多了就懒得改了，要用新的google_gcc-4.9-main，改成像这样的就可以了 export PATH="/root/Toolchain/clang-r383902b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"  自己改吧。。
export PATH="/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"

#使用google_gcc-4.8
#export PATH="/root/Toolchain/google_gcc-4.8/bin:$PATH"


echo "           "
echo "编译环境清理中....."
echo "           "
#clean，环境清理
make ${args} clean && make ${args} mrproper
rm kernel.log kernel-defconfig.log && rm -rf out 
mkdir -p out

#基本配置信息
export KV=$(make kernelversion)
printf "\t##################################################\n"
printf "内核版本为:$KV\n"
printf "内核配置为:$KD\n"
printf "\t##################################################\n"

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "-------------------打印编译器信息--------------------"
echo "           "
aarch64-linux-android-gcc -v
aarch64-linux-android-ld -v
echo "           "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "           "
arm-linux-androideabi-gcc -v
arm-linux-androideabi-ld -v
echo "           "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"




echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> ./kernel-defconfig.log 
echo "时间_`date +'%Y-%m-%d %H:%M:%S'`----内核配置为_$KD----内核版本为_$KV----编译器环境变量配置为_$PATH" >> ./kernel-defconfig.log
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> ./kernel-defconfig.log

echo "           "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "开始构建内核.....时间为_`date +'%Y-%m-%d %H:%M:%S'`----内核配置为_$KD----内核版本为_$KV----编译器配置为_$PATH"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "           "
#build 构建内核
#内核将在 out/arch/arm64/boot下生成通常为Image,Image.gz.dtb,Image.gz等
make -j6 ARCH=arm64 SUBARCH=arm64 O=out CROSS_COMPILE="ccache aarch64-linux-android-" CROSS_COMPILE_ARM32="ccache arm-linux-androideabi-" ${KD}

make -j6 ARCH=arm64 SUBARCH=arm64 O=out CROSS_COMPILE="ccache aarch64-linux-android-" CROSS_COMPILE_ARM32="ccache arm-linux-androideabi-" menuconfig 


