#!/bin/bash
#####################################################################
# fail2kick,a solution combine monitor host,warn by email	    #
# auto ban ip and kick it.					    #
# Author        Hehl <1181554113@qq.com>                            #
# Blog          Http://www.yunweijilu.com                           #
#####################################################################

#monitor host
echo -e "${YELLOW}"
while true;do echo
	read -p "Do you want monitor host?(y/n)  " monitor_yn
	if [[ ! $monitor_yn =~ ^[y,Y,n,N]$ ]];then
		echo -e "Input error, please input y or n."
	else
		break
	fi
done

#monitor secure
while true;do echo
	read -p "Do you want count secure log?(y/n)  " monitor_sec
	if [[ ! $monitor_sec =~ ^[y,Y,n,N]$  ]];then
		echo -e "Input error, please input y or n."
	elif [[ $monitor_sec =~ ^[y,Y]$ ]];then
		read -p "Input Number you all ssh:(default 5)  " ssh_count
                if [[ -z $ssh_count ]];then
                        ssh_count=5 
                fi
		break
	else
		break
	fi
done

if [[ $monitor_yn =~ ^[Y|y]$ ]];then
	. include/monitor.sh 
fi

if [[ $monitor_sec =~ ^[y|y]$ ]];then
	. include/deny_add.sh
fi
