#! /bin/bash 
echo "######KernelSU的一键补丁脚本2，可重复执行，获得最新KernelSU版本######"
echo "           "
echo "######使用方法修改export KD=vendor/xxxx_defconfig或当前终端直接 export KD=xxxxx_defconfig或export KD=vendor/xxxxx_defconfig，xxxxx_defconfig为你机型的内核配置并运行此脚本，然后按一般方式构建内核######"
echo "           "
echo "脚本为官方构建方式，需要魔法"


#export KD=gemini_defconfig

#手机的内核配置文件，一般在内核源码目录下的arch/arm64/configs或arch/arm64/configs/vendor下，一般为机型代号，高通骁龙处理器代号啥的，比如mi5 的为gemini_defconfig,一加8系列为kona_pref_defconfig,按实际情况修改
#export KD=gemini_defconfig 
#KD=vendor/xxxx_defconfig或KD=xxxx_defconfig


echo " -----------------------------------------------------------------------------"
echo "----------------   你设置的内核配置文件为:$KD   ----------------"
echo " -----------------------------------------------------------------------------"

#env
export GKI_ROOT=$(pwd)
export ARCH=arm64
export SUBARCH=arm64
rm -rf $GKI_ROOT/KernelSU $GKI_ROOT/drivers/kernelsu




echo "         "
echo "         "
echo "#添加KernelSU,到内核树请确保良好的魔法环境"
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -

echo "         "
#添加KernelSU内核配置，当然已经在内核源内运行过一遍，可将此5项注释掉，多次执行也没问题指不过会在 dervierMarkfile,KERNEL_DEFCONFIG}_defcofig引入过多重复，无影响。。。。
echo "CONFIG_KPROBES=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"
echo "CONFIG_HAVE_KPROBES=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"
echo "CONFIG_KPROBE_EVENTS=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"

#下面2项，按情况选择吧。
echo "CONFIG_OVERLAY_FS=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"
echo "CONFIG_MODULES=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"

echo "           "
echo "KernelSU补丁完成，请按一般方式构建内核"
echo "           "

