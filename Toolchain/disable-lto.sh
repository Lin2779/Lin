#! /bin/bash 
echo "######禁用clang-lto相关的以确保最大限度保证内核编译成功 修改export KD=vendor/cmi_user_defconfig或当前终端直接 export KD=xxxxx_defconfig或export KD=vendor/xxxxx_defconfig，xxxxx_defconfig为你机型的内核配置并运行此脚本，然后按一般方式构建内核######"
echo "           "

#手机的内核配置文件(KERNEL_DEFCONFIG简称KD，一般在内核源码目录下的arch/arm64/configs或arch/arm64/configs/vendor下，一般为机型代号，高通骁龙处理器代号啥的，比如mi5 的为gemini_defconfig,一加8系列为kona_pref_defconfig,按实际情况修改
#export KD=vendor/cmi_user_defconfig

#KD=vendor/xxxx_defconfig或KD=xxxx_defconfig                                        
echo " -----------------------------------------------------------------------------"
echo "----------------   你设置的内核配置文件为:$KD   ----------------"
echo " -----------------------------------------------------------------------------"

                                   
export GKI_ROOT=$(pwd)

#旧内核部分
sed -i 's/CONFIG_LTO=y/CONFIG_LTO=n/' "$GKI_ROOT/arch/arm64/configs/${KD}"
sed -i 's/CONFIG_LTO_CLANG=y/CONFIG_LTO_CLANG=n/' "$GKI_ROOT/arch/arm64/configs/${KD}"
sed -i 's/CONFIG_THINLTO=y/CONFIG_THINLTO=n/' "$GKI_ROOT/arch/arm64/configs/${KD}"


echo "         " >> "$GKI_ROOT/arch/arm64/configs/${KD}"
echo "CONFIG_LTO_NONE=y" >> "$GKI_ROOT/arch/arm64/configs/${KD}"

echo "CONFIG_CC_WERROR=n" >> "$GKI_ROOT/arch/arm64/configs/${KD}"



#禁用强栈保护。有些内核会默认开启，就会导致编译器无法继续编译，报错。
sed -i '/CONFIG_CC_STACKPROTECTOR_STRONG/d' "$GKI_ROOT/arch/arm64/configs/${KD}"

echo "             " >> "$GKI_ROOT/arch/arm64/configs/${KD}"
echo "# CONFIG_CC_STACKPROTECTOR_STRONG is not set" >> "$GKI_ROOT/arch/arm64/configs/${KD}"

##禁用内核debug，有些开启会导致编译报错。
sed -i '/CONFIG_DEBUG_FS/d' "$GKI_ROOT/arch/arm64/configs/${KD}"
echo "             " >> "$GKI_ROOT/arch/arm64/configs/${KD}"

echo "# CONFIG_DEBUG_FS is not set" >> "$GKI_ROOT/arch/arm64/configs/${KD}"


#GKI内核部分
sed -i 's/CONFIG_DEBUG_INFO_BTF=y/CONFIG_DEBUG_INFO_BTF=n/' "$GKI_ROOT/arch/arm64/configs/${KD}"
sed -i 's/CONFIG_LTO_CLANG_FULL=y/CONFIG_LTO_CLANG_FULL=n/' "$GKI_ROOT/arch/arm64/configs/${KD}"
sed -i 's/CONFIG_CFI_CLANG=y/CONFIG_CFI_CLANG=n/' "$GKI_ROOT/arch/arm64/configs/${KD}"

echo "         "
echo "运用配置完成，请按一般方式构建内核"
echo "         "
