#!/bin/bash
#####################################################################
# fail2kick,a solution combine monitor host,warn by email	    #
# auto ban ip and kick it.					    #
# Author        Hehl <1181554113@qq.com>                            #
# Blog          Http://www.yunweijilu.com                           #
#####################################################################

your_ip=`who | tr -d "()" | awk -F' ' '{print $5}'| uniq`
host_ip=$(curl members.3322.org/dyndns/getip 2>/dev/null)
echo Your ip: $your_ip
echo Host ip: $host_ip
