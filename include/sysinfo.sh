#!/bin/bash
#####################################################################
# fail2kick,a solution combine monitor host,warn by email	    #
# auto ban ip and kick it.					    #
# Author        Hehl <1181554113@qq.com>                            #
# Blog          Http://www.yunweijilu.com                           #
#####################################################################

#Monitor cpu
chk_cpu(){
cpu_model=`cat /proc/cpuinfo  | grep "model name" | uniq | awk -F: '{print $2}'`
cpu_physical=`cat /proc/cpuinfo | grep "physical id" | awk -F : '{print $2}' |wc -l`
cpu_cores=`cat /proc/cpuinfo| grep "cpu cores"| awk -F: '{print $2}'|uniq`
echo "cpu model:$cpu_model"
echo "cpu physical:$cpu_physical"
echo "cpu cores:$cpu_cores"
}

#Monitor ram
chk_ram(){
ram_total_s=`cat /proc/meminfo  | grep MemTotal | tr -d "MemTotal:kB "`
ram_free_s=`cat /proc/meminfo  | grep MemFree | tr -d "MemFree:kB "`
binary=1024
((ram_total=$ram_total_s/$binary))
((ram_free=$ram_free_s/$binary))
echo "cpu total: $ram_total MB"
echo "cpu free : $ram_free MB"
}

#Print system info
sysinfo(){
echo "sysbit: $sys_bit"
echo "OS:$sys_os"
}


echo -e "${GREEN}"
chk_cpu
chk_ram
sysinfo

#Monitor network

