#! /bin/bash
starttime=`date +'%Y-%m-%d %H:%M:%S'`
#一般只修改KD,KERNEL值就可以了，其他几乎可不动。
#export KD=xxxxx_defconfig
#export KD=vendor/xxxxx_defconfig


echo "           "
echo "           "
echo "你设置的内核配置文件为$KD,并打印在kernel-defconfig.log"
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

#取消相应注释，以切换不同编译器。注意也要修改2.sh中的相应位置。PATH,KERNEL等变量。

#更佳合理科学的googlle gcc-4.9,推荐此版本google_gcc-4.9-main
#export PATH="/root/Toolchain/clang-4579689/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-4630689/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-4639204/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r4718d/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r328903/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r339409b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r344140b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r346389b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r346389c/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r349610b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r353983b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r353983c/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r365631/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r365631c/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r365631c1/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r370808/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r377782d/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


export PATH="/root/Toolchain/clang-r383902b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r399163/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r399163b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r407598/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r407598b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r412851/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r416183/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r433403/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r437112b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r450784/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r487747/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r498229b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#-----------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------
#使用google_gcc-4.9构建内核，保留。也可以用。但推荐使用↑↑↑↑↑google_gcc-4.9-main来构建内核。
#export PATH="/root/Toolchain/clang-r353983b/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r365631/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r370808/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r377782d/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r383902b/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r399163b/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r407598/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r412851/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r4161831/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r433403/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r437112b/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"

#export PATH="/root/Toolchain/clang-r450784/bin:/root/Toolchain/google_gcc-4.9/bin:$PATH"
#-----------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------

args="-j6 \
ARCH=arm64 \
SUBARCH=arm64 \
O=out \
CROSS_COMPILE=aarch64-linux-android- \
CROSS_COMPILE_ARM32=arm-linux-androideabi- \
CLANG_TRIPLE=aarch64-linux-gnu- "

echo "           "
echo "编译环境清理中....."
echo "           "
#clean，环境清理
make ${args} clean && make ${args} mrproper
rm kernel.log kernel-defconfig1.log kernel-defconfig2.log && rm -rf out 
mkdir -p out

#基本配置信息

export KV=$(make kernelversion)
printf "\t##################################################\n"
printf "内核版本为:$KV\n"
printf "内核配置为:$KD\n"
printf "\t##################################################\n"



echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "-------------------打印编译器信息--------------------"
echo "-------------------这是脚本1.sh的编译器配置信息--------------------"
clang -v

aarch64-linux-android-ld -v
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> ./kernel-defconfig1.log 
echo "时间_`date +'%Y-%m-%d %H:%M:%S'`----内核配置为_$KD----内核版本为_$KV----编译器环境变量配置为_$PATH" >> ./kernel-defconfig1.log
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> ./kernel-defconfig1.log

echo "           "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "开始构建内核.....时间为_`date +'%Y-%m-%d %H:%M:%S'`----内核配置为_$KD----内核版本为_$KV----编译器配置为_$PATH"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "           "




echo "           "
echo "图形化配置内核中....."
echo "           "
#build 构建内核
#内核将在 out/arch/arm64/boot下生成通常为Image,Image.gz.dtb,Image.gz等
make CC="ccache clang" ${args} ${KD}
make CC="ccache clang" ${args} menuconfig

