#!/bin/bash
#####################################################################
# fail2kick,a solution combine monitor host,warn by email	    #
# auto ban ip and kick it.					    #
# Author        Hehl <1181554113@qq.com>                            #
# Blog          Http://www.yunweijilu.com                           #
#####################################################################

#Get List
grep failure $seq_log_dir | awk -F "=" '{ print $7 }' | tr -d "[a-z]" | tr -s " \n"|sort |uniq -c|sort -n -r > ip.txt

#Seprate ip and count
a=( `awk '{print $1}' ip.txt` )
b=( `awk '{print $2}' ip.txt` )
for ((i=0; i<${#a[@]}; ++i))
do
	if [ ${a[$i]} -ge $ssh_count ];then
		echo "${b[$i]}" >> /etc/hosts.deny
	fi
done

#Restart sshd service
/etc/init.d/sshd restart
