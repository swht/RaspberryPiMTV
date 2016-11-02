#!/bin/bash
#######################################################
#Atuor:qingbo.song
#Date:2016.11.02
#Comment:初始化脚本
#E-mail:qingbo.song@gmail.com
#github:https://github.com/swht/RaspberryPiMTV.git
#Version:v1.0
#######################################################

#依赖环境：
#mplayer   apt-get install mplayer
#qiv  apt-get install qiv
#python3  apt-get install python3
#supervisor  pip install supervisor

#设置开机启动幻灯片
cp ./supervisord.conf /etc/supervisord.conf
echo "supervisord -f /etc/supervisord.conf" >> /etc/rc.local ##注意将rc.local下面的exit 0去掉或注释掉

#启动supervisord程序
mkidr -p /var/log/supervisor/
sudo supervisord -c /etc/supervisord.conf
