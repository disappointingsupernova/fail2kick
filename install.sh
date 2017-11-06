#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
. include/common.sh
clear
printf "
#####################################################################
# fail2kick,a solution combine monitor host,warn by email	    #
# auto ban ip and kick it.					    #
# Author        Hehl <1181554113@qq.com>                            #
# Blog          Http://www.yunweijilu.com                           #
#####################################################################
"
#monitor host
echo -e "${GREEN}"
while true;do
read -p "Do you want monitor host?(y/n)  " monitor_yn
	case $monitor_yn in
	y|Y)
		. include/monitor.sh
		break
	;;
	n|N)
		echo "You select do not monitor host."
		break
	;;
	*)
		echo "Input Error for monitor_yn!"
	;;
	esac
done

#monitor secure
while true;do
read -p "Do you want monitor secure log?(y/n)  " monitor_sec
	case $monitor_sec in
	y|Y)
		. include/deny_add.sh
	;;
	n|N)
		echo "You select do not monitor secure."
	;;
	*)
		echo "Input Error for Monitor secure!"
	;;
	esac

