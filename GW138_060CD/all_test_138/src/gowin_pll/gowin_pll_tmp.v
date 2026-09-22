//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.10.02
//Part Number: GW5AT-LV60PG484AES
//Device: GW5AT-60
//Device Version: B
//Created Time: Wed Sep 25 22:16:02 2024

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_PLL your_instance_name(
        .lock(lock), //output lock
        .clkout0(clkout0), //output clkout0
        .clkin(clkin) //input clkin
    );

//--------Copy end-------------------
