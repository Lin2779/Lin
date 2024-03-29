#! /bin/bash 
starttime=`date +'%Y-%m-%d %H:%M:%S'`
echo "######LXC的一键编译脚本2######"
echo "           "

#手机的内核配置文件，一般在内核源码目录下的arch/arm64/configs或arch/arm64/configs/vendor下，一般为机型代号，高通骁龙处理器代号啥的，比如mi5 的为gemini_defconfig,一加8系列为kona_pref_defconfig,按实际情况修改
#
#机型
#export NAME=Mi10

#export KD=xxxxx_defconfig 
#export KD=vendor/xxxxx_defconfig
echo " -----------------------------------------------------------------------------"
echo "----------------   你设置的内核配置文件为:$KD 机型设置为:$NAME  ----------------"
echo " -----------------------------------------------------------------------------"



#内核产品的格式类型通常为Image或 Image.gz-dtb，Image.gz等，默认Image
export KERNEL=Image

#env

export GKI_ROOT=$(pwd)
export ARCH=arm64
export SUBARCH=arm64

export PATH="/root/Toolchain/clang-r383902b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"

#export PATH="/root/Toolchain/clang-r399163b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r407598/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"

#export PATH="/root/Toolchain/clang-r412851/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r416183/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r433403/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r437112b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r450784/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r487747/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


#export PATH="/root/Toolchain/clang-r498229b/bin:/root/Toolchain/google_gcc-4.9-main/aarch64/bin:/root/Toolchain/google_gcc-4.9-main/arm/bin:$PATH"


args="-j4 \
ARCH=arm64 \
SUBARCH=arm64 \
O=out \
CROSS_COMPILE=aarch64-linux-android- \
CROSS_COMPILE_ARM32=arm-linux-androideabi- \
CLANG_TRIPLE=aarch64-linux-gnu- "



echo "        "
echo "环境清理"
echo "        "
make clean && make mrproper
rm -rf $GKI_ROOT/out $GKI_ROOT/kernel.log 
mkdir -p out

echo "         "
echo "#添加LXC配置,到内核"
echo "         "
cp /root/Toolchain/utils $GKI_ROOT/ -R
cp /root/Toolchain/LXC-DOCKER-OPEN-CONFIG.sh $GKI_ROOT
chmod +x *.sh

cp ./arch/arm64/configs/$KD ./arch/arm64/configs/kernel-`date '+%Y%m%d%H%M%S'`_defconfig
echo "---------------- 此脚本会强制修改$KD,所以已经重新备份原$KD到arch/arm64/configs/kernel-`date '+%Y%m%d%H%M%S'`_defconfig ----------"
sh $GKI_ROOT/LXC-DOCKER-OPEN-CONFIG.sh $GKI_ROOT/arch/arm64/configs/${KD} -w


sed -i '/CONFIG_ANDROID_PARANOID_NETWORK/d' "$GKI_ROOT/arch/arm64/configs/${KD}"

echo "# CONFIG_ANDROID_PARANOID_NETWORK is not set" >> "$GKI_ROOT/arch/arm64/configs/${KD}"

sed -i '/CONFIG_LOCALVERSION/d' "$GKI_ROOT/arch/arm64/configs/${KD}"

echo 'CONFIG_LOCALVERSION="-LXC-support_Pdx"' >> "$GKI_ROOT/arch/arm64/configs/${KD}"

echo "         "
echo "         "
echo "#运用LXC相关补丁"
echo "         "
echo "         "

if [ -f $GKI_ROOT/kernel/cgroup/cgroup.c ]; then
      sh $GKI_ROOT/utils/runcpatch.sh $GKI_ROOT/kernel/cgroup/cgroup.c
fi

if [ -f $GKI_ROOT/kernel/cgroup.c ]; then
      sh $GKI_ROOT/utils/runcpatch.sh $GKI_ROOT/kernel/cgroup.c
fi

if [ -f $GKI_ROOT/net/netfilter/xt_qtaguid.c ]; then
       patch -p0 < $GKI_ROOT/utils/xt_qtaguid.patch
fi


echo "           "
echo "#build 构建内核,请耐心等待"
echo "           "
#内核将在 out/arch/arm64/boot下生成通常为Image或 Image.gz.dtb
make CC="ccache clang" ${args} ${KD}
make CC="ccache clang" ${args} 2>&1 | tee kernel.log


#预先清理一下/root/Toolchain/AnyKernel3/可能遗留的文件，防止打包混乱。
rm -rf /root/Toolchain/AnyKernel3/*.zip /root/Toolchain/AnyKernel3/Image /root/Toolchain/AnyKernel3/Image.gz-dtb /root/Toolchain/AnyKernel3/Image.gz /root/Toolchain/AnyKernel3/dtbo.img 

# 打包内核，用AnyKernel3进行打包,最终内核成品在 /mnt目录下
if [ -f $GKI_ROOT/out/arch/${ARCH}/boot/${KERNEL} ]
	then
		cp -rf $GKI_ROOT/out/arch/${ARCH}/boot/${KERNEL} /root/Toolchain/AnyKernel3 ;

                cp -rf $GKI_ROOT/out/arch/${ARCH}/boot/dtbo.img /root/Toolchain/AnyKernel3 ;
		cd /root/Toolchain/AnyKernel3 ;
		zip -r kernel-LXC-KernelSU_`date '+%Y%m%d%H%M'`.zip  . ;
		mv *.zip /mnt ;
		rm ${KERNEL} dtbo.img ;
		echo "           "
		echo "           "
		echo "build kernel success, the kernel products is /mnt"
		echo "成功构建内核，并打包好最终内核产品在 /mnt目录下，请用twrp或ex内核管理器刷写内核，并验证"
		echo "           "
                echo "           "
	else
	        echo "           "
	        echo "           "
	        echo "build kernel failed ,please check the kernel.log"
                echo "构建内核失败，请检查编译日志kernel.log"

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
