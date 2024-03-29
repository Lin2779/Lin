#! /bin/bash
starttime=`date +'%Y-%m-%d %H:%M:%S'`

#KERNEL的可取值有Image,Image.gz-dtb,Image.gz等
export KERNEL=Image


export ARCH=arm64
export SUBARCH=arm64

#取消相应注释，以切换不同编译器。注意也要修改1.sh中的相应位置。PATH,KERNEL等变量。

#更佳合理科学的googlle gcc-4.9
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



基本配置信息
export KV=$(make kernelversion)
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "-------------------打印编译器信息--------------------"

echo "-------------------这是脚本2.sh的编译器配置信息，请确保和1.sh的编译器配置一致--------------------"
clang -v

aarch64-linux-android-ld -v
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


export KV=$(make kernelversion)
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> ./kernel-defconfig2.log 
echo "时间_`date +'%Y-%m-%d %H:%M:%S'`----内核配置为_$KD----内核版本为_$KV----编译器环境变量配置为_$PATH" >> ./kernel-defconfig2.log
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> ./kernel-defconfig2.log

echo "           "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "开始构建内核.....时间为_`date +'%Y-%m-%d %H:%M:%S'`----内核配置为_$KD----内核版本为_$KV----编译器配置为_$PATH"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "           "





#build 构建内核
#内核将在 out/arch/arm64/boot下生成通常为Image,Image.gz.dtb,Image.gz等
make CC="ccache clang" ${args} savedefconfig
make CC="ccache clang" ${args} 2>&1 | tee kernel.log

#预先清理一下/root/Toolchain/AnyKernel3/可能遗留的文件，防止打包混乱。
rm -rf /root/Toolchain/AnyKernel3/*.zip /root/Toolchain/AnyKernel3/Image /root/Toolchain/AnyKernel3/Image.gz-dtb /root/Toolchain/AnyKernel3/Image.gz /root/Toolchain/AnyKernel3/dtbo.img 

# 打包内核，用AnyKernel3进行打包,最终内核成品在 /mnt目录下,名称为 kernel+日期的zip包，可通过twrp或ex内核管理器刷入，验证。

if [ -f ./out/arch/${ARCH}/boot/${KERNEL} ]
	then
		cp -rf ./out/arch/${ARCH}/boot/${KERNEL} /root/Toolchain/AnyKernel3
		cd /root/Toolchain/AnyKernel3 ;
		zip -r kernel-`date '+%Y%m%d%H%M'`.zip  . ;
		mv *.zip /mnt ;
		rm ${KERNEL} ;
		echo "           "
		echo "           "
		echo "build kernel success, the kernel products is /mnt"
		echo "构建内核成功，内核产品在/mnt目录下，名称为 kernel+日期形式的zip包，可通过twrp或ex内核管理器刷入，验证"
		echo "           "
		echo "           "
	else
	        echo "           "
	        echo "           "
	        echo "build kernel failed ,please check the kernel.log"
		echo "构建内核失败，请检查kernel.log"
	fi


#耗时统计
echo "           "
echo "--------------------------------"
endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date=" $starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo Start: $starttime.
echo End: $endtime.
echo "Build Time: "$((end_seconds-start_seconds))"s."
echo "--------------------------------"
