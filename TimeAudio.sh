#!/bin/bash
#######################################################
#Atuor:qingbo.song
#Date:2016.10.31
#Comment:实现整点报时功能
#crontab -e : 0 * * * * sudo sh /home/RaspberryPiMTV/TimeAudio.sh 2>&1 >> /tmp/TimeAudio.log
#E-mail:qingbo.song@gmail.com
#github:https://github.com/swht
#Version:v1.0
#######################################################

mp3_path=/home/RaspberryPiMTV/TimeAudio
mplayer_path=/usr/bin/mplayer
hour=`date|awk -F " " '{print $5}'|awk -F ":" '{print $1}'`
hourAudioFile="${mp3_path}/${hour}.mp3"
echo ${hourAudioFile}

${mplayer_path} ${hourAudioFile}