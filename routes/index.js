var express = require('express');
var router = express.Router();
var fs = require('fs');
/* GET home page. */

Date.prototype.Format = function (fmt) { //author: meizz   
	var o = {
		"M+": this.getMonth() + 1,                 //月份   
		"d+": this.getDate(),                    //日   
		"h+": this.getHours(),                   //小时   
		"m+": this.getMinutes(),                 //分   
		"s+": this.getSeconds(),                 //秒   
		"q+": Math.floor((this.getMonth() + 3) / 3), //季度   
		"S": this.getMilliseconds()             //毫秒   
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}

//判断文件目录并遍历文件
router.get('/', function (req, res, next) {
	var today = new Date().Format("yyyy-MM-dd-hh:mm");
	var array = today.split('-');
	var year = array[0];
	var month = array[1];
	var hour = array[3];
	var imagebasepath = '../public/images';
	var dirList = fs.readdirSync(imagebasepath + '/' + year + '/' + month);
	var filePath = '/images/' + year + '/' + month;
	if (fs.existsSync(imagebasepath + '/' + year) && fs.existsSync(imagebasepath + '/' + year + '/' + month)) {
		dirList.forEach(function (fileName) {
			console.log(filePath + '/' + fileName);
			readImage(fileName)
		});
	} else {
		console.log(imagebasepath + year);

		console.log('default_img');
		readImage(fileName);
	}
});


function readImage(fileName) {
	fs.readFile(dirList + '/' + fileName, 'binary', function (err, file) {
		if (err) {
			console.log(err);
			return;
		} else {
			console.log('浏览图片!')
			res.render('index', { title: '图片浏览', url: filePath + '/' + fileName });
		}
	});
}
module.exports = router;
