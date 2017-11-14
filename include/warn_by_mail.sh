#!/bin/bash
#####################################################################
# fail2kick,a solution combine monitor host,warn by email	    #
# auto ban ip and kick it.					    #
# Author        Hehl <1181554113@qq.com>                            #
# Blog          Http://www.yunweijilu.com                           #
#####################################################################

echo -e "$WHITE"
#Install necessary mail
if [ $os == "centos" ];then
	if [ `rpm -qa |grep mailx |wc -l` -lt 1 ];then
		Install mailx
	fi
elif [ $os == "ubuntu" ];then
	if [ `dpkg -l|grep heirloom-mailx |wc -l` -lt 1 ];then
		Install heirloom-mailx
	fi
	if [ `dpkg -l|grep sendmail|wc -l` -lt 1 ];then
		Install sendmail
	fi
fi

#send mail
echo "The SSH failed times and IP is below:" >> mail.txt
cat ip.txt >> mail.txt
mailx -s "SSH Failed IP List_`date`" $mail_addr < mail.txt
[ $? -eq 0 ] && echo -e "${GREEN}Send mail success!"
