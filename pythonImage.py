#!/usr/bin env python3
#######################################################
#Atuor:qingbo.song
#Date:2016.11.02
#Comment:实现幻灯片播放功能
#E-mail:qingbo.song@gmail.com
#github:https://github.com/swht/RaspberryPiMTV.git
#Version:v1.0
#######################################################

import os,datetime

qiv_path = "/usr/bin/qiv"
base_path = os.getcwd()
today = str(datetime.date.today()).split('-') #['2016', '11', '02']
def_pic = base_path + '/picture/default_img'
Current_month_pic = base_path + '/picture/life_img/' + today[0] + '/' + today[1]
try:
    if os.path.isdir(Current_month_pic):
        os.system("%s  -s -d 5 -f -m -i %s" % (qiv_path,Current_month_pic))
    else:
        os.system("%s  -s -d 5 -f -m -i %s" % (qiv_path,def_pic))
except Exception as e :
    print("Error:",e)
