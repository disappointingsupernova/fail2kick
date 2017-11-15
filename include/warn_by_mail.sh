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
	if [ `rpm -qa|grep postfix|wc -l` -ge 1 ];then
		yum remove -y postfix
	fi
	if [ `rpm -qa |grep mailx |wc -l` -lt 1 ];then
		Install mailx
	fi
	[ `rpm -qa|grep sendmail|wc -l` -lt 1 ] && Install sendmail
elif [ $os == "ubuntu" ];then
	if [ `dpkg -l|grep postfix|wc -l` -eq 1 ];then
		apt-get remove -y postfix
	fi
	if [ `dpkg -l|grep heirloom-mailx |wc -l` -lt 1 ];then
		Install heirloom-mailx sendmail
	fi
fi

#check sendmail status
[ `ps aux|grep sendmail|grep -v grep|wc -l` -ne 1 ] && service sendmail start >/dev/null 2>&1

#send mail
echo "The SSH failed times and IP is below:" >> mail.txt
cat ip.txt >> mail.txt
mailx -s "SSH Failed IP List_`date`" $mail_addr < mail.txt
[ $? -eq 0 ] && echo -e "${GREEN}Send mail success!"

#check mail send status
echo -e "${GREEN}Mailstats below:${WHITE}"
mailstats
