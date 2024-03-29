#! /bin/bash 
echo "######KVM的一键开启脚本,只对部分MTK处理器的内核。export KD=vendor/cmi_user_defconfig或当前终端直接 export KD=xxxxx_defconfig或export KD=vendor/xxxxx_defconfig，xxxxx_defconfig为你机型的内核配置并运行此脚本，然后按一般方式构建内核######"
echo "           "

#手机的内核配置文件(KERNEL_DEFCONFIG简称KD，一般在内核源码目录下的arch/arm64/configs或arch/arm64/configs/vendor下，一般为机型代号，高通骁龙处理器代号啥的，比如mi5 的为gemini_defconfig,一加8系列为kona_pref_defconfig,按实际情况修改
#export KD=vendor/cmi_user_defconfig

#KD=vendor/xxxx_defconfig或KD=xxxx_defconfig                                        
echo " -----------------------------------------------------------------------------"
echo "----------------   你设置的内核配置文件为:$KD   ----------------"
echo " -----------------------------------------------------------------------------"

                                   
export GKI_ROOT=$(pwd)


echo "         "
echo "#添加KVM配置,到内核"
echo "         "

echo "CONFIG_VIRTUALIZATION=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"

echo "CONFIG_KVM=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"

echo "CONFIG_VHOST_NET=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"


echo "CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"


#sed -i '/CONFIG_LOCALVERSION/d' "$GKI_ROOT/arch/arm64/configs/${KD}"

#echo 'CONFIG_LOCALVERSION="-KVM-support"' >> "$GKI_ROOT/arch/arm64/configs/${KD}"


echo "         "
echo "运用补丁已开启内核kvm的相关配置，请按一般方式构建内核，只有部分mtk处理器内核在el2下启动，开启才有效，比如红米note10pro,红米k40gaming(游戏增强版）"
echo "         "


