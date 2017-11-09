#!/bin/bash
#####################################################################
# fail2kick,a solution combine monitor host,warn by email	    #
# auto ban ip and kick it.					    #
# Author        Hehl <1181554113@qq.com>                            #
# Blog          Http://www.yunweijilu.com                           #
#####################################################################

echo -e "$GREEN"
#Add Your ip to allow
sed -i '/sshd:'$your_ip'/d' $hosts_deny
if [ `grep $your_ip $hosts_allow | wc -l` -ne 1 ];then
	sed -i '/sshd:'$your_ip'/d' $hosts_allow
	echo "sshd:$your_ip" >> $hosts_allow
fi

#Get List
grep "failure" $sec_log_dir | awk -F "=" '{ print $7 }' | tr -d "[a-z]" | tr -s " \n"|sort |uniq -c|sort -n -r > ip.txt

#Seprate ip and count
a=( `awk '{print $1}' ip.txt` )
b=( `awk '{print $2}' ip.txt` )
for ((i=0; i<${#a[@]}; ++i))
do
	if [ ${a[$i]} -ge $ssh_count ];then
		if [ `grep ${b[$i]} $hosts_deny | wc -l` -ge 1 ];then
			sed -i '/sshd:'${b[$i]}'/d' $hosts_deny
		fi
		echo "sshd:${b[$i]}" >> $hosts_deny
	fi
done

#Restart sshd service
if [ $? -eq 0 ];then
	echo "Add ip success!"
else
	echo "Add ip failed!"
	exit 1
fi
echo -e "$WHITE"
service sshd restart


