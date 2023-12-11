# Gowin

**描述**：Gowin（高云）是国产FPGA里做的比较好的几家之一（安路、紫光、高云、复旦微等）。由于开发板和实际项目较少，此处按开发板对工程项目进行分类。



**其他**：大部分工程均有从Cyclone IV仓库移植的影子，如有其他项目需求移步Cyclone IV的仓库。



**主要目录**：

+ Pocket_lab_F0: 基于高云GW1N-LV9的一款FPGA开发板，易思达和高云大学计划出品
+ Pocket_lab_F2: 基于高云GW2A-LV18的一款FPGA开发板，易思达和高云大学计划出品
+ Tang Mega 138K：基于 GW5AST-LV138 的一款FPGA开发板，Sipeed出品，曾用于 2023 年全国大学生 FPGA 大赛高云赛区
+ [Tang Primer 20K](https://wiki.sipeed.com/primer20k)：基于 GW2A-LV18 的一款FPGA开发板，Sipeed出品，曾用于 2022-2023 年全国大学生 FPGA 大赛高云赛区
+ [Tang Nano 20K](https://wiki.sipeed.com/hardware/zh/tang/tang-nano-20k/nano-20k.html): 基于GW2A-LV18的一款FPGA开发板，Sipeed出品
+ [Tang Nano 9K](https://wiki.sipeed.com/tang9k)：基于 GW1NR-LV9 的一款 FPGA 开发板，Sipeed出品
+ [Tang Nano 4K](https://wiki.sipeed.com/tang4k)：基于 GW1NSR-LV4C 的一款 FPGA 开发板，Sipeed出品
+ [Tang Nano 1K](https://wiki.sipeed.com/tang1k)：基于 GW1NZ-LV1 的一款 FPGA 开发板，Sipeed 出品

+ GW020AB：基于Tang Primer 20K二次开发的一款FPGA开发板，BigPig-Bro出品，其中A款为原生Sipeed下载器接口，B款为独立USB+标准JTAG接口(FT方案下载) 闲鱼搜大猪蹄子 高云 FPGA可购买
+ GW020C：基于GW2A-LV18的一款FPGA开发板，BigPig-Bro出品， 闲鱼搜大猪蹄子 高云 FPGA可购买



## 常见问题

1、为什么下载的代码不能直接烧录？

+ 因为综合生成的临时文件夹较为繁杂，没有同步到github，需要用户clone后自行编译生成下载文件

2、为什么综合报错？

+ 部分采用SV或复用IO口的工程会报错，请在Project - > Configuration 中Place&Route下Dual-Purpose IO找到报错的复用IO勾选上，或在Synthesize的General下选择SystemVerilog2017,即可
