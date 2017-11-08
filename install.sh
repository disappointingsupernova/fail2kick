#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
clear
printf "
#####################################################################
# fail2kick,a solution combine monitor host,warn by email	    #
# auto ban ip and kick it.					    #
# Author        Hehl <1181554113@qq.com>                            #
# Blog          Http://www.yunweijilu.com                           #
#####################################################################
"
fail2kick(){
. include/common.sh
. include/sysinfo.sh
. include/Menu.sh
}

fail2kick 2>&1 | tee fail2kick.log
echo -e "$WHITE"
