//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.9 Beta-5
//Part Number: GW5AST-LV138PG484AC1/I0
//Device: GW5AST-138B
//Device Version: B
//Created Time: Mon Feb 02 22:41:14 2026

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    sys_pll your_instance_name(
        .lock(lock_o), //output lock
        .clkout0(clkout0_o), //output clkout0
        .clkin(clkin_i), //input clkin
        .reset(reset_i) //input reset
    );

//--------Copy end-------------------
