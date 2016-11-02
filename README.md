# RaspberryPiMTV
基于树莓派(debian系统)实现的简易电子相册系统：

功能实现：

	1.以幻灯片的形式循环播放当前月份目录下面的图片；
	2.当前月份目录不存在或者目录下面没有图片，则优先使用上个月份的图片目录图片进行放映；
	3.计划任务设置执行脚本，实现定时整点报时和播放整点视频功能；
	4.每天00：00自动执行git同步远程图片；

环境依赖：

1.qiv

	安装：apt-get install qiv
		qiv  -s -d 300 -f -m -i file_path
	备注：-s 以幻灯片的方式播放
		  -d 300 幻灯片延迟300s 5分钟播放一次
		  -f 全屏
		  -m 对超大的照片进行等比例压缩处理
		  -i 去除图片下面显示的路径信息
		  -T 图片发生变化重新加载
		  -p 开启显示透明图像的透明效果
		  -R 只读模式
		  -S 随机模式
		  -M 按照英文字母顺序排序
		  -N 按照数字先后顺序进行排序
2.mplayer

	安装：apt-get install mplayer
		mplayer -fs /videoname
	备注：-fs 全屏播放视频

3.python3

	
部署：
	
	crontab
	0 * * * * sudo sh /home/RaspberryPiMTV/TimeAudio.sh 2>&1 >> /tmp/TimeAudio.log