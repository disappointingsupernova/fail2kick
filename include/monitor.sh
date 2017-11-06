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
cpu_physical=`cat /proc/cpuinfo | grep "physical id" | awk -F : '{print $2}' | uniq`
cpu_cores=`cat /proc/cpuinfo| grep "cpu cores"| awk -F: '{print $2}'|uniq`
echo "cpu model:$cpu_model"
echo "cpu physical:$cpu_physical"
echo "cpu cores:$cpu_cores"
}
chk_cpu

#Monitor ram
chk_ram(){
ram_total=`cat /proc/meminfo  | grep MemTotal`
ram_free=`cat /proc/meminfo  | grep MemFree`
echo -e "$ram_total\n$ram_free"
}
chk_ram
