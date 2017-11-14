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
	read -p "Monitor host? (y/n)  " monitor_yn
	if [[ ! $monitor_yn =~ ^[y,Y,n,N]$ ]];then
		echo -e "Input error, please input y or n."
	else
		break
	fi
done

#monitor secure
while true;do echo
	read -p "Deny the failed ip? (y/n)  " deny_yn
	if [[ ! $deny_yn =~ ^[y,Y,n,N]$  ]];then
		echo -e "Input error, please input y or n."
	elif [[ $deny_yn =~ ^[y,Y]$ ]];then
		read -p "You allow ssh failed times:(default 5)  " ssh_count
                if [[ -z $ssh_count ]];then
                        ssh_count=5 
                fi
		break
	else
		break
	fi
done

#Send mail
while true;do echo
	read -p "Send ssh failed ip by email? (y/n)  " mail_yn
	if [[ ! $mail_yn =~ ^[Y,y,n,N]$ ]];then
		echo -e "Input error, please input y or n."
	elif [[ $mail_yn =~ ^[y,Y]$ ]];then
		chk_ip
		read -p "Input the mail address:  " mail_addr
		break
	else
		break
	fi

done

if [[ $monitor_yn =~ ^[Y|y]$ ]];then
	. include/monitor.sh 
fi

if [[ $deny_yn =~ ^[Y|y]$ ]];then
	. include/deny_add.sh
fi

if [[ $mail_yn =~ ^[Y|y]$ ]];then
	. include/warn_by_mail.sh
fi
