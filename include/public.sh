#!/bin/bash
#####################################################################
# fail2kick,a solution combine monitor host,warn by email	    #
# auto ban ip and kick it.					    #
# Author        Hehl <1181554113@qq.com>                            #
# Blog          Http://www.yunweijilu.com                           #
#####################################################################

#check ip.txt
chk_ip(){
if [ ! -f ip.txt ];then
	echo -e "${RED}There is no ip.txt,please add deny ip."
	exit 1
fi
}
