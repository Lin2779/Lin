#!/bin/bash

FILE=$1

[ -f "$FILE" ] || {
	echo "Provide a config file as argument"
	exit
}

write=false

if [ "$2" = "-w" ]; then
	write=true
fi

CONFIGS_ON="
CONFIG_IKCONFIG
CONFIG_CPUSETS
CONFIG_AUTOFS4_FS
CONFIG_TMPFS_XATTR
CONFIG_TMPFS_POSIX_ACL
CONFIG_CGROUP_DEVICE
CONFIG_SYSVIPC
CONFIG_CGROUPS
CONFIG_NAMESPACES
CONFIG_UTS_NS
CONFIG_IPC_NS
CONFIG_USER_NS
CONFIG_PID_NS
CONFIG_NET_NS
CONFIG_DEVTMPFS
CONFIG_DEVTMPFS_MOUNT
CONFIG_FSNOTIFY
CONFIG_DNOTIFY
CONFIG_INOTIFY_USER
CONFIG_FANOTIFY
CONFIG_FANOTIFY_ACCESS_PERMISSIONS
CONFIG_BT
CONFIG_BT_RFCOMM
CONFIG_BT_RFCOMM_TTY
CONFIG_BT_BNEP
CONFIG_BT_BNEP_MC_FILTER
CONFIG_BT_BNEP_PROTO_FILTER
CONFIG_BT_HIDP
CONFIG_BT_HCIBTUSB_BCM
CONFIG_BT_HCIBTUSB_RTL
CONFIG_BT_HCIUART
CONFIG_BT_HCIBCM203X
CONFIG_BT_HCIBPA10X
CONFIG_BT_HCIBFUSB
CONFIG_CFG80211_WEXT
CONFIG_MAC80211
CONFIG_MAC80211_MESH
CONFIG_DNS_RESOLVER
CONFIG_FHANDLE
CONFIG_EPOLL
CONFIG_SIGNALFD
CONFIG_TIMERFD
CONFIG_TMPFS_POSIX_ACL
CONFIG_USB_RTL8150
CONFIG_USB_RTL8152
CONFIG_MEDIA_DIGITAL_TV_SUPPORT
CONFIG_MEDIA_SDR_SUPPORT
CONFIG_MEDIA_TUNER_MSI001
CONFIG_USB_AIRSPY
CONFIG_USB_HACKRF
CONFIG_USB_MSI2500
CONFIG_DVB_RTL2830
CONFIG_DVB_RTL2832
CONFIG_DVB_RTL2832_SDR
CONFIG_DVB_SI2168
CONFIG_DVB_ZD1301_DEMOD
CONFIG_USB_ACM
CONFIG_USB_CONFIGFS_SERIAL
CONFIG_USB_CONFIGFS_ACM
CONFIG_USB_CONFIGFS_OBEX
CONFIG_USB_CONFIGFS_NCM
CONFIG_USB_CONFIGFS_ECM
CONFIG_USB_CONFIGFS_ECM_SUBSET
CONFIG_USB_CONFIGFS_RNDIS
CONFIG_USB_CONFIGFS_EEM
CONFIG_USB_CONFIGFS_MASS_STORAGE
CONFIG_USB_LAN78XX
CONFIG_WLAN_VENDOR_ATH
CONFIG_ATH9K_HTC
CONFIG_CARL9170
CONFIG_ATH6KL
CONFIG_ATH6KL_USB
CONFIG_WLAN_VENDOR_MEDIATEK
CONFIG_MT7601U
CONFIG_WLAN_VENDOR_RALINK
CONFIG_RT2X00
CONFIG_RT2500USB
CONFIG_RT73USB
CONFIG_RT2800USB
CONFIG_RT2800USB_RT33XX
CONFIG_RT2800USB_RT35XX
CONFIG_RT2800USB_RT3573
CONFIG_RT2800USB_RT53XX
CONFIG_RT2800USB_RT55XX
CONFIG_RT2800USB_UNKNOWN
CONFIG_WLAN_VENDOR_REALTEK
CONFIG_RTL8187
CONFIG_RTL_CARDS
CONFIG_RTL8192CU
CONFIG_RTL8XXXU_UNTESTED
CONFIG_WLAN_VENDOR_ZYDAS
CONFIG_USB_ZD1201
CONFIG_ZD1211RW
CONFIG_USB_NET_RNDIS_WLAN
CONFIG_BT_HCIVHCI
CONFIG_MACVLAN
CONFIG_CHECKPOINT_RESTORE
CONFIG_UNIX_DIAG
CONFIG_PACKET_DIAG
CONFIG_NETLINK_DIAG
CONFIG_MEDIA_TUNER
"

CONFIGS_OFF="
CONFIG_MEDIA_SUBDRV_AUTOSELECT
CONFIG_MEDIA_TUNER_SIMPLE
CONFIG_MEDIA_TUNER_TDA18250
CONFIG_MEDIA_TUNER_TDA8290
CONFIG_MEDIA_TUNER_TDA827X
CONFIG_MEDIA_TUNER_TDA18271
CONFIG_MEDIA_TUNER_TDA9887
CONFIG_MEDIA_TUNER_TEA5761
CONFIG_MEDIA_TUNER_TEA5767
CONFIG_MEDIA_TUNER_MT20XX
CONFIG_MEDIA_TUNER_MT2060
CONFIG_MEDIA_TUNER_MT2063
CONFIG_MEDIA_TUNER_MT2266
CONFIG_MEDIA_TUNER_MT2131
CONFIG_MEDIA_TUNER_QT1010
CONFIG_MEDIA_TUNER_XC2028
CONFIG_MEDIA_TUNER_XC5000
CONFIG_MEDIA_TUNER_XC4000
CONFIG_MEDIA_TUNER_MXL5005S
CONFIG_MEDIA_TUNER_MXL5007T
CONFIG_MEDIA_TUNER_MC44S803
CONFIG_MEDIA_TUNER_MAX2165
CONFIG_MEDIA_TUNER_TDA18218
CONFIG_MEDIA_TUNER_FC0011
CONFIG_MEDIA_TUNER_FC0012
CONFIG_MEDIA_TUNER_FC0013
CONFIG_MEDIA_TUNER_TDA18212
CONFIG_MEDIA_TUNER_E4000
CONFIG_MEDIA_TUNER_FC2580
CONFIG_MEDIA_TUNER_M88RS6000T
CONFIG_MEDIA_TUNER_TUA9001
CONFIG_MEDIA_TUNER_SI2157
CONFIG_MEDIA_TUNER_IT913X
CONFIG_MEDIA_TUNER_R820T
CONFIG_MEDIA_TUNER_MXL301RF
CONFIG_MEDIA_TUNER_QM1D1C0042
CONFIG_MEDIA_TUNER_QM1D1B0004
CONFIG_DVB_STB0899 
CONFIG_DVB_STB6100 
CONFIG_DVB_STV090x 
CONFIG_DVB_STV0910 
CONFIG_DVB_STV6110x 
CONFIG_DVB_STV6111 
CONFIG_DVB_MXL5XX 
CONFIG_DVB_DRXK 
CONFIG_DVB_TDA18271C2DD 
CONFIG_DVB_SI2165 
CONFIG_DVB_MN88472 
CONFIG_DVB_MN88473 
CONFIG_DVB_CX24110 
CONFIG_DVB_CX24123 
CONFIG_DVB_MT312 
CONFIG_DVB_ZL10036 
CONFIG_DVB_ZL10039 
CONFIG_DVB_S5H1420 
CONFIG_DVB_STV0288 
CONFIG_DVB_STB6000 
CONFIG_DVB_STV0299 
CONFIG_DVB_STV6110 
CONFIG_DVB_STV0900 
CONFIG_DVB_TDA8083 
CONFIG_DVB_TDA10086 
CONFIG_DVB_TDA8261 
CONFIG_DVB_VES1X93 
CONFIG_DVB_TUNER_ITD1000 
CONFIG_DVB_TUNER_CX24113 
CONFIG_DVB_TDA826X 
CONFIG_DVB_TUA6100 
CONFIG_DVB_CX24116 
CONFIG_DVB_CX24117 
CONFIG_DVB_CX24120 
CONFIG_DVB_SI21XX 
CONFIG_DVB_TS2020 
CONFIG_DVB_DS3000 
CONFIG_DVB_MB86A16 
CONFIG_DVB_TDA10071 
CONFIG_DVB_SP8870 
CONFIG_DVB_SP887X 
CONFIG_DVB_CX22700 
CONFIG_DVB_CX22702 
CONFIG_DVB_S5H1432 
CONFIG_DVB_DRXD 
CONFIG_DVB_L64781 
CONFIG_DVB_TDA1004X 
CONFIG_DVB_NXT6000 
CONFIG_DVB_MT352 
CONFIG_DVB_ZL10353 
CONFIG_DVB_DIB3000MB 
CONFIG_DVB_DIB3000MC 
CONFIG_DVB_DIB7000M 
CONFIG_DVB_DIB7000P 
CONFIG_DVB_DIB9000 
CONFIG_DVB_TDA10048 
CONFIG_DVB_EC100 
CONFIG_DVB_STV0367 
CONFIG_DVB_CXD2820R 
CONFIG_DVB_CXD2841ER 
CONFIG_DVB_CXD2880 
CONFIG_DVB_VES1820 
CONFIG_DVB_TDA10021 
CONFIG_DVB_TDA10023 
CONFIG_DVB_STV0297 
CONFIG_DVB_NXT200X 
CONFIG_DVB_OR51211 
CONFIG_DVB_OR51132 
CONFIG_DVB_BCM3510 
CONFIG_DVB_LGDT330X 
CONFIG_DVB_LGDT3305 
CONFIG_DVB_LG2160 
CONFIG_DVB_S5H1409 
CONFIG_DVB_AU8522 
CONFIG_DVB_AU8522_DTV 
CONFIG_DVB_AU8522_V4L 
CONFIG_DVB_S5H1411 
CONFIG_DVB_S921 
CONFIG_DVB_DIB8000 
CONFIG_DVB_MB86A20S 
CONFIG_DVB_TC90522 
CONFIG_DVB_MN88443X 
CONFIG_DVB_PLL 
CONFIG_DVB_TUNER_DIB0070 
CONFIG_DVB_TUNER_DIB0090 
CONFIG_DVB_DRX39XYJ 
CONFIG_DVB_LNBH25 
CONFIG_DVB_LNBH29 
CONFIG_DVB_LNBP21 
CONFIG_DVB_LNBP22 
CONFIG_DVB_ISL6405 
CONFIG_DVB_ISL6421 
CONFIG_DVB_ISL6423 
CONFIG_DVB_A8293 
CONFIG_DVB_LGS8GL5 
CONFIG_DVB_LGS8GXX 
CONFIG_DVB_ATBM8830 
CONFIG_DVB_TDA665x 
CONFIG_DVB_IX2505V 
CONFIG_DVB_M88RS2000 
CONFIG_DVB_AF9033 
CONFIG_DVB_HORUS3A 
CONFIG_DVB_ASCOT2E 
CONFIG_DVB_HELENE 
CONFIG_DVB_CXD2099 
CONFIG_DVB_SP2 


"
CONFIGS_EQ="
CONFIG_DEFAULT_HOSTNAME='\kali\'
"

ered() {
	echo -e "\033[31m" $@
}

egreen() {
	echo -e "\033[32m" $@
}

ewhite() {
	echo -e "\033[37m" $@
}

echo -e "\n\nChecking config file for kali specific config options.\n\n"

errors=0
fixes=0

for c in $CONFIGS_ON $CONFIGS_OFF;do
	cnt=`grep -w -c $c $FILE`
	if [ $cnt -gt 1 ];then
		ered "$c appears more than once in the config file, fix this"
		errors=$((errors+1))
	fi

	if [ $cnt -eq 0 ];then
		if $write ; then
			ewhite "Creating $c"
			echo "# $c is not set" >> "$FILE"
			fixes=$((fixes+1))
		else
			ered "$c is neither enabled nor disabled in the config file"
			errors=$((errors+1))
		fi
	fi
done

for c in $CONFIGS_ON;do
	if grep "$c=y\|$c=m" "$FILE" >/dev/null;then
		egreen "$c is already set"
	else
		if $write ; then
			ewhite "Setting $c"
			sed  -i "s,# $c is not set,$c=y," "$FILE"
			fixes=$((fixes+1))
		else
			ered "$c is not set, set it"
			errors=$((errors+1))
		fi
	fi
done

for c in $CONFIGS_EQ;do
	lhs=$(awk -F= '{ print $1 }' <(echo $c))
	rhs=$(awk -F= '{ print $2 }' <(echo $c))
	if grep "^$c" "$FILE" >/dev/null;then
		egreen "$c is already set correctly."
		continue
	elif grep "^$lhs" "$FILE" >/dev/null;then
		cur=$(awk -F= '{ print $2 }' <(grep "^$lhs=" "$FILE"))
		ered "$lhs is set, but to $cur not $rhs."
		if $write ; then
			egreen "Setting $c correctly"
			sed -i 's,^'"$lhs"'.*,# '"$lhs"' was '"$cur"'\n'"$c"',' "$FILE"
			fixes=$((fixes+1))
		fi
	else
		if $write ; then
			ewhite "Setting $c"
			echo  "$c" >> "$FILE"
			fixes=$((fixes+1))
		else
			ered "$c is not set"
			errors=$((errors+1))
		fi
	fi
done

for c in $CONFIGS_OFF;do
	if grep "$c=y\|$c=m" "$FILE" >/dev/null;then
		if $write ; then
			ewhite "Unsetting $c"
			sed  -i "s,$c=.*,# $c is not set," $FILE
			fixes=$((fixes+1))
		else
			ered "$c is set, unset it"
			errors=$((errors+1))
		fi
	else
		egreen "$c is already unset"
	fi
done

if [ $errors -eq 0 ];then
	egreen "\n\nConfig file checked, found no errors.\n\n"
else
	ered "\n\nConfig file checked, found $errors errors that I did not fix.\n\n"
fi

if [ $fixes -gt 0 ];then
	egreen "Made $fixes fixes.\n\n"
fi

ewhite " "
