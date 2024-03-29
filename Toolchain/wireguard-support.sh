#! /bin/bash 
echo "######wireguard一键支持脚本，修改export KD=vendor/cmi_user_defconfig或当前终端直接 export KD=xxxxx_defconfig或export KD=vendor/xxxxx_defconfig，xxxxx_defconfig为你机型的内核配置并运行此脚本，然后按一般方式构建内核######"
echo "           "

#手机的内核配置文件(KERNEL_DEFCONFIG简称KD，一般在内核源码目录下的arch/arm64/configs或arch/arm64/configs/vendor下，一般为机型代号，高通骁龙处理器代号啥的，比如mi5 的为gemini_defconfig,一加8系列为kona_pref_defconfig,按实际情况修改
#export KD=vendor/cmi_user_defconfig

#KD=vendor/xxxx_defconfig或KD=xxxx_defconfig                                        
echo " -----------------------------------------------------------------------------"
echo "----------------   你设置的内核配置文件为:$KD   ----------------"
echo " -----------------------------------------------------------------------------"

                                   
export GKI_ROOT=$(pwd)


echo "         "
echo "#添加wireguard配置到内核"
echo "         "

mv net/wireguard net/wireguard.bak
mkdir -p net/wireguard

cp /root/Toolchain/wireguard-src/*.xz $GKI_ROOT/net -R
tar -xf *.xz && rm *.xz

ln -sfT "$GKI_ROOT/net/wireguard-linux-compat-1.0.20220627/src" "$GKI_ROOT/net/wireguard"
echo "CONFIG_WIREGUARD=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"

sed -i "/^obj-\\\$(CONFIG_NETFILTER).*+=/a obj-\$(CONFIG_WIREGUARD) += wireguard/" "$GKI_ROOT/net/Makefile"
sed -i "/^if INET\$/a source \"net/wireguard/Kconfig\"" "$GKI_ROOT/net/Kconfig"



echo "         "
echo "运用wireguard配置完成，请按一般方式构建内核"
echo "         "
