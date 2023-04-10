# 工程环境

+ FPGA开发板 ：TangPrimer-20K
+ SD卡：根目录存储一个.bmp图片，480x272就行
+ 屏幕：通用40pin 480x272 @ 60fps（下图有一条绿杠是工程板G通道缺失问题，零售版不存在

# 下载现象

+ FPGA先从SD卡读取BMP图片到DDR3，再从DDR3循环读取推送到LCD

![Finish](Finish.jpg)
