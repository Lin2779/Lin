此脚本有何区别？
1。全员ccache加速二次构建（所有脚本中都启用了ccache）
2。引入官方llvm +自定义的electron-binutils来构建内核，支持llvm 8.06-17.06  electron-binutils版本支持2.31-2.41
3。使用全新配置并编译的google_gcc-4.9-main, （ aarch64 lxc ubuntu 14.04，gcc-4.7编译，可在ubuntu14.04以上的系统上使用）编译器配置和运行在x86的google gcc-4.9几乎一致，当然为了可成功编译不得不禁用某些配置，设计更合理32位gcc和64位gcc分别安装在不同位置，避免不必要的问题。


4。加入kali官方的内核构建器kali-nethunter-kernel文件夹，一键kali-nethunter补丁Kali-kernel-patch.sh，一键开启kali-nethunter内核配置Kali-Nethunter-base-OPEN-CONFIG.sh ，Kali-Nethunter-full-OPEN-CONFIG.sh  ，Kali-Nethunter-kali-offical-OPEN-CONFIG.sh 和第二类lxc补丁方法LXC-patch2.sh

5.。画个饼，加入并没有的electron-clang版本electron-clang-14.0.0.sh electron-clang-16.0.6.sh ............(有时间又搞）







1。编译环境
手机LXC/chroot/proot/环境 Ubuntu 18.04及以上(推荐18.04
   tmoe的termux linux项目一键安装
   linux Deploy，可用我制作的一键恢复包 https://www.coolapk.com/feed/47357538?shareKey=MjAyODA2M2IwMTFiNjVhNmI1OTU~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
   
   ubuntu 18.04
   htttps://www.coolapk.com/feed/47142899?shareKey=NTZjNGE2MjM3YjI2NjVhNmI1YTg~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
   
   直接在termux中pull个docker镜像或直接启动个termux lxc容器环境（需要手机内核支持）
   arm64 docker
   https://www.coolapk.com/feed/48908551?shareKey=ZmFmZGIyMTQ4MmMyNjVhNmI1Njc~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
   
   arm64 docker2
   https://www.coolapk.com/feed/50144231?shareKey=NzNiM2EyMjgwZTk3NjVhNmI2MGE~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
   
   termux lxc恢复包
   https://www.coolapk.com/feed/50582763?shareKey=MTIzYzJmYmU3ZTc5NjVhNmI2MzY~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
   
  直接刷magisk lxc模块（需要手机内核支持）https://www.coolapk.com/feed/50023315?shareKey=MmMxMGYwZmQzYjU2NjVhNmI1NDI~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
  
2。依赖
  apt update && apt update -y && apt install -y git libssl-dev gcc-arm-linux-gnueabi build-essential libncurses5-dev bzip2 make gcc g++ grep bc curl bison flex openssl lzop ccache unzip zlib1g-dev file ca-certificates ccache wget cmake texinfo ca-certificates zlib1g-dev xz-utils libelf-dev zip libgmp-dev xz-utils libncurses-dev g++ gawk m4 libtinfo5 cpio binutils-dev libelf-dev cmake ninja-build texinfo u-boot-tools python zstd clang
  
  
3。获得内核源码，将Toolchain.tar.xz解压到 /root目录下，下载并解压我编译的工具链到/root/Toolchain目录下，在内核源码目录执行, (或按需选择复制）
 # cp /root/Toolchain/*.sh . 
 然后在当前终端中设置内核配置文件KD，或直接修改脚本中的KD,KERNEL等变量。
比如小米10内核配置文件KD如下
 # export KD=vendor/cmi_user_defconfig
 
 编译器/工具链下载 适合在arm64设备上使用（手机，树莓派,）
 https://github.com/tomxi1997/build-aosp-clang-for-arm64/releases
 https://github.com/tomxi1997/AOSP-Clang_arm64/releases
 https://www.coolapk.com/feed/52175320?shareKey=ZjdjNDkwNjg5NDcxNjVhNmI0YmE~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
 
 个人酷安动态
 linaro gcc
 https://www.coolapk.com/feed/52915061?shareKey=NGQzOTA1MTEyMDZiNjVhNmI0ZTU~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
 
 llvm+binutils
 httpps://www.coolapk.com/feed/52076385?shareKey=M2MwZTQ5N2Q2YzUxNjVhNmI0ZmU~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
 
 较旧的
 https://www.coolapk.com/feed/47357987?shareKey=Nzg4Y2Q3MWE5ZDA2NjVhNmI1ZTE~&shareUid=25509431&shareFrom=com.coolapk.market_13.4.1
 


4。然后运行任意编译脚本,当然是要按照实际情况选择，即可生成AnyKernel3的内核包，可通过twrp或ex内核管理器刷入，验证。
exral-patch.sh为禁用clang-lto相关的以确保最大限度保证内核编译成功。可选
例如
./clang-r383902b.sh
或
./clang-r412851.sh
或
./electron-clang-12.0.0.sh
或
./google_gcc-4.9.sh
或
./linaro_gcc-7.5.sh
或
./llvm-10.0.1.sh


对于需要KernelSU支持的可执行（即先打ksu补丁，然后选择执行任意编译脚本）
./KSU-patch1.sh && ./clang-r383902b.sh
或
./KSU-patch2.sh && ./clang-r383902b.sh
或
./kernelsu_build1.sh
或
./kernelsu_build2.sh

同理需要LXC支持则（即先打lxc补丁，然后选择执行任意编译脚本）
./LXC-patch1.sh && ./clang-r383902b.sh
或
./LXC-patch2.sh && ./clang-r383902b.sh
或
./lxc_build1.sh
或
./lxc_build2.sh

同理需要同时需要KernelSU-LXC支持则
./KSU-patch1.sh && ./LXC-patch1.sh && ./clang-r383902b.sh
或
./KSU-patch2.sh && ./LXC-patch1.sh && ./clang-r383902b.sh
或
./KSU-patch1.sh && ./LXC-patch2.sh && ./clang-r383902b.sh
或
./KSU-patch2.sh && ./LXC-patch2.sh && ./clang-r383902b.sh
或
./lxc-ksu_build1.sh
或
./lxc-ksu_build2.sh


一般内核编译（图形化配置内核)好1.sh 2.sh默认使用clang-r383902b+google_gcc-4.9-main 来构建内核，如需更换其他编译器则自行修改。a.sh 
b.sh使用google_gcc-4.9-main来构建内核，适合古董内核编译。
export KD=xxxxx_defconfig
./1.sh 
配置好内核后运行
./2.sh
完成内核编译





一键集成kali-nethunter 
export KD=xxxxx_defconfig
export KV=x.xx
./Kali-Nethunter-Patch.sh
./clang-r383902b.sh （按实际情况选择编译脚本）
即可在/mnt目录下有支持kali-nethunter的内核

   
 关于google_gcc-4.9推荐使用google_gcc-4.9-main.sh它更加科学合理。
   
   注意注意注意！！！！
以上↑↑↑↑补丁脚本和任意编译脚本执行前一定要在当前终端中设置内核配置KD值
一定要执行 export KD=vendor/xxxxx_defconfig或export KD=xxxxx_defconfig
   
   
   
   
   
   
 关于kali-nethunter-kernel可参考此文，非常的详细
   https://droidkali.github.io/2021/09/12/build-nethunter-kernel.html/
   
   本/root/Toolchain/kali-nethunter-kernel 下有离线网页，es文件管理器选择打开方式为html查看器或kiwi浏览器打开即可查看
   
   
   如何构建kali-nethunter-kernel内核,看↑↑↑↑面的详细介绍。就两点，运用kali Nethunter的官方内核补丁，然后/图形化配置内核，开启kali-nethunter所需的内核配置，编译并用AnyKernel3打包即可（这是标准的方法),而下↓↓面的方法是在打入kali-nethunter的内核补丁后，直接修改内核配置文件（非标准方法，可能会因为各种依赖关系，而未正确配置内核。具体表现是内核配置文件直接写了某项配置，结果在编译后该功能不能使用，而究其根本就是未正确配置内核而没编译进内核或者出了某些问题，还有就是直接编辑内核配置文件会导致编译失败,不信你打开任何一个内核配置文件开头就有Automatically generated file; DO NOT EDIT.意思就是禁止编辑修改，要用标准化的方法来配置内核，只不过弄清依赖关系，该加的加，不加的不加，一般也问题不大，不过还是推荐图形化配置内核，自动匹配依赖关系，就选选就完了，也不费事）
   
   
   
   
   对于想一键开启nethunter内核配置的，可在内核源码根目录执行
  KD值为内核配置文件
   ./Kali-Nethunter-base-OPEN-CONFIG.sh arch/arm64/configs/$KD -w
    或
./Kali-Nethunter-full-OPEN-CONFIG.sh arch/arm64/configs/$KD -w
或
./Kali-Nethunter-kali-offical-OPEN-CONFIG.sh arch/arm64/configs/$KD -w


关于打kali-nethunter内核补丁，推荐使用官方的方法

内核源码根目录执行
make kernelversion  来查看内核版本，可能为4.4.11 4.14.110 4.19.124 3.18.111这样的，取前面的大的版本号即可 分别是4.04 4.14 4.19 3.18

(或者本Toolchain文件夹中也有，可能会过时。cp -R /root/Toolchain/kali-nethunter-kernel .  )

git clone https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-kernel

cd kali-nethunter-kernel

./build.sh
输入数字4后回车，选择对应的内核版本，比如 4.19,那么输入10后回车，然后逐次选则想要运用的补丁并运用。


对于我写的一键kali-nethunter补丁脚本Kali-kernel-patch.sh，则使用如下
#kali nethunter的一键补丁脚本，使用方法确保此脚本和kali-nethunter-kernel文件夹在内核源码目录下，修改export KD=vendor/cmi_user_defconfig或当前终端直接 make kernelversion查看内核版本，并设置 export KV值或直接修改。export KD=xxxxx_defconfig或export KD=vendor/xxxxx_defconfig，xxxxx_defconfig为你机型的内核配置并运行此脚本，然后按一般方式构建内核######"

就内核源码目录下（内核版本只支持4.04 4.09 4.14 4.19,即KV的可选值，4.04以下自己研究吧）
总结一下就是
export KD=xxxxx_defconfig
export KV=x.xx
./Kali-Nethunter-Patch.sh
./clang-r383902b.sh （按实际情况选择编译脚本）
即可在/mnt目录下有支持kali-nethunter的内核



图形化配置kali-nethunter-kernel么就,内核源码根目录下执行
先运用kali-nethunter官方的内核补丁，然后图形化配置内核，编译打包

例如，内核源码根目录下执行
git clone https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-kernel

cd kali-nethunter-kernel

./build.sh
输入数字4后回车，选择对应的内核版本，比如 4.19,那么输入10后回车，然后逐次选则想要运用的补丁并运用。

./1.sh
然后图形化配置内核,按方向键选择，y确认启用相关配置，n取消相关配置，m编译为内核模块。光标定位到 save回车保存内核配置，按2次esc退出。
强烈推荐参考https://droidkali.github.io/2021/09/12/build-nethunter-kernel.html/
  本/root/Toolchain/kali-nethunter-kernel 下有离线网页，es文件管理器选择打开方式为html查看器或kiwi浏览器打开即可查看。
  

./2.sh
保存内核配置并编译。最终会在/mnt目录下有内核zip包，twrp/ex内核管理器刷入。




目前为止arm64上可用的编译器
版本数     
18 gcc + 9 ubuntu（18.04-22.04） （ubuntu可用apt安装的gcc至少3-4种gcc版本）

自编译gcc
5 arm gcc
4 linaro_gcc
1 pdx-gcc
2 google_gcc (基于google_gcc-4.8-4.9源码编译,2个版本）
共计12种版本（基于arm/linaro/官方gcc的历史源码编译），还有些上arm官方直接有aarch64的直接二进制压缩包，估计6种版本或个数。arm gcc 10以后，之前只有跑在x86_64机器上的）

29 clang-r* （基于谷歌aosp clang源码补丁后编译clang-4579689-clang-r498229b）+9 ubuntu（18.04-22.04)（ubuntu可用apt安装的clang至少3-4种clang版本）
5  electron-clang （自编译 electron-clang9.0- electron-clang-13）
18 llvm（官方一直支持aarch64,有直接二进制压缩包）
19 binutils （自编译binutils 2.31-2.41,可配合llvm用于内核编译）
74种版本的工具链


自编译gcc
5 arm gcc
4 linaro_gcc
1 pdx-gcc
2 google_gcc (4.8-4.9)
12

自编译clang
29 clang-r*
5  electron-clang
34

自编译编译器合计12+34=46种，总二进制大小（解压后）轻松超过50G。

在arm64 可用编译器 自编译gcc+自编译clang+arm官方部分gcc+llvm(只统计llvm 8以后的版本，以大版本下的2个版本为数llvm-10.0.0和llvm-10.0.1计数为2，共计18）+ 3个版本的ubuntu gcc/clang,每个版本下至少有3类编译器，那么gcc/clang共计18种)总共就是
12+34+6+18+18=88种（不计自编译的binutils）


##结束语
总之在arm64上编译安卓内核，不确定性太多。此工具链不适应mtk平台，部分高通，猎户座平台。因为根本性的原因,有些安卓内核根本无法在arm64上编译出来，所以通用性上到x86_64 linux平台使用AOSP clang+ Google gcc-4.9 来解决。虽然说本工具链clang-rxxxxx部分是使用aosp clang的源码+aosp patch在arm64上重新编译的，但不是真正的aosp clang arm64,只能算作第三方的运行在arm64的仿aosp clang。本工具链集从一定程度上解决了arm64平台上编译安卓内核的问题，估计除mtk平台外可以编译80％的内核，选择工具链也有针对性（直接选择和x86平台"一样的clang版本和gcc"），arm64上可选的工具链也更多了，（不然只有ubuntu的预编译的gcc，clang,还有就是llvm的clang,其他的真的没选择）。开发本工具链的初衷是，没有电脑🖥的时期，楼主就是这样的。主要是对kali-nethunter引发的，没有官方支持的内核，也没电脑，以及可随时diy内核，基于这样的想法💡，不断学习摸索才搞到至今。本人呢也非计算机专业，是搞农学。搞这些东西呢只能说可以用，就这样。

在arm64跑内核的正确方法如下？
获得非mtk内核源码,内核源码目录
cp /root/Toolchain/*.sh . 
export KD=xxxxx_defconfig
./clang-r383902b.sh     （按实际情况选择）

先空跑一遍，能跑出内核并刷入开机，测试没问题，则进行lxc,KernelSU,kali-nethunter相关操作或自定义diy。

如果编译过程中出现二进制错误或不可执行文件，马上放弃，到x86_64平台编译，别浪费时间。或者换内核源码


如果出现一些错误尝试解决后或无法解决的，到x86_64平台

如果试尽所有编译脚本，均失败，到x86_64平台

还有一些是无法在arm64上编译出的，部分高通，猎户座，移步到x86_64平台


wireguard报错修复，删除以下
https://github.com/nathanchance/marlin/commit/4e4a52719ddf6c28229cf19a666aa3d7f0f7238c








