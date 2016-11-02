#!/bin/bash
#######################################################
#Atuor:qingbo.song
#Date:2016.10.31
#Comment:实现整点报时功能
#crontab -e : 0 * * * * sudo sh /home/RaspberryPiMTV/TimeAudio.sh 2>&1 >> /tmp/TimeAudio.log
#E-mail:qingbo.song@gmail.com
#github:https://github.com/swht/RaspberryPiMTV.git
#Version:v1.0
#######################################################

mp3_path=/home/RaspberryPiMTV/TimeAudio
video_path=/home/RaspberryPiMTV/TimeVideo
mplayer_path=`which mplayer`
hour=`date|awk -F " " '{print $5}'|awk -F ":" '{print $1}'`
hourAudioFile="${mp3_path}/${hour}.mp3"
hourVideoFile="${video_path}/${hour}.*"
git_path=`which git`
echo ${hourAudioFile}
${mplayer_path} ${hourAudioFile}
if [ ${hour} -eq 00 ]
then
    ${git_path} pull
    #reload pythonImage
fi
if [ ${hour} -ge 06 ] && [ ${hour} -le 21 ]
then
    if [ -f hourVideoFile ]
    then
        ${mplayer_path} -fs ${video_path}/Wildlife.wmv
    else
        echo 'hhh'
        # ${mplayer_path} -fs ${hourVideoFile}
    fi
fi
