# fail2kick  
fail2kick是用来监控主机负载和防止非法用户破解ssh登陆的shell脚本,类似于denyhosts,区别在于本脚本采用的是bash shell编写,无需安装python环境.
## 介绍  
根据ssh登陆产生的log日志文件,对ssh登陆失败日志进行分析截取(RedHat系列日志在/var/log/secure,Debian系列在/var/log/auth.log)
把超过次数的IP加入/etc/hosts.deny文件,已达到防止暴力破解的目的.
 1. 监控功能
- 监控主机cpu,内存,网络流量
- 提取远程sshd登陆失败用户,生成用户详细列表,包括时间点,用户名,来源ip,失败次数 
 2. 邮件告警
- 根据监控功能,发送紧急邮件提醒,每月发送运行情况统计
 3. 自定义功能
- 自定义允许ssh在自定义时间段内的失败次数
- 自定义发送邮件时间时间间隔

## 部署  
方式一：点击下载https://gitee.com/hehl/fail2kick/repository/archive/master.zip  
方式二：git clone https://gitee.com/hehl/fail2kick.git  (需要安装git)  

```
cd fail2kick  
./install.sh    
```
![1](http://imgs.yunweijilu.com/img/fail2kick/1.jpg)  
打印结果  
![2](http://imgs.yunweijilu.com/img/fail2kick/2.jpg)  
可以上ip138.com查看IP归属地

## 注:
 -  默认5分钟之内登陆失败10次以上,对登陆的ip进行屏蔽,30分钟后自行移除
 -  可自行修改配置,设置检测时间,允许的失败次数,以及多久移除黑名单IP

