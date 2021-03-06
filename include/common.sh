#!/bin/bash

#set color
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
WARN="\033[41;37m"
WHITE="\033[0m"

#Define variable
hosts_deny="/etc/hosts.deny"
hosts_allow="/etc/hosts.allow"
your_ip=`who | tr -d "()" | awk -F' ' '{print $5}'| uniq`
host_ip=$(curl members.3322.org/dyndns/getip 2>/dev/null)

#check run privileges
if [ `id -u` -ne 0 ];then
	echo "Please run with root privileges!"
	exit 1
fi

#check system OS
chk_sys(){
if [ -f /etc/redhat-release ];then
	sys_os=`cat /etc/redhat-release`
	os="centos"
elif [ -f /etc/issue ];then
	if [ `cat /etc/issue | grep -i "Cent" |wc -l` -eq 1 ];then
		sys_os=`cat /etc/issue | grep -i "Cent"`
		os="centos"
	elif [ `cat /etc/issue | grep -i "Ubuntu" | wc -l` -eq 1 ];then
		sys_os=`cat /etc/issue | grep -i "Ubuntu"`
		os="ubuntu"
	elif [ -f /proc/version ];then
		if [ `cat /proc/version | grep -i "Red Hat"|wc -l` -eq 1 ];then
			sys_os=`cat /proc/version | grep -i "Red Hat"`
			os="centos"
		else 
			sys_os=`cat /proc/version | grep -i "Ubuntu"`
			os="ubuntu"
		fi
	else
		echo "Unsupport system OS!"
		exit 0
		
	fi
else
	echo "Unsupport system OS!"
	exit 0
fi

[ `getconf LONG_BIT` -eq 64 ] && sys_bit=64 || sys_bit=32
}
chk_sys

#Define install way
Install(){
if [ $os == "centos" ];then
	yum install -y $*
	
else
	apt-get install -y $*
fi
}

#check TCP_Wrappers installed, hosts deny need this
if [ `ldd /usr/sbin/sshd  | grep libwrap |wc -l` -ne 1 ];then
	echo "It will install tcp_wrappers"
	if [ $os == "centos" ];then
		$Install tcp_wrappers
	else
		$Install tcp_wrappers
	fi
fi

#define secure log
if [ $os == "centos" ];then
	sec_log_dir="/var/log/secure"
else
	sec_log_dir="/var/log/auth.log"
fi

