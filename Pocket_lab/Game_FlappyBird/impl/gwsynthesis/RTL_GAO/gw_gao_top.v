module gw_gao(
    \tube0_x[11] ,
    \tube0_x[10] ,
    \tube0_x[9] ,
    \tube0_x[8] ,
    \tube0_x[7] ,
    \tube0_x[6] ,
    \tube0_x[5] ,
    \tube0_x[4] ,
    \tube0_x[3] ,
    \tube0_x[2] ,
    \tube0_x[1] ,
    \tube0_x[0] ,
    \tube1_x[11] ,
    \tube1_x[10] ,
    \tube1_x[9] ,
    \tube1_x[8] ,
    \tube1_x[7] ,
    \tube1_x[6] ,
    \tube1_x[5] ,
    \tube1_x[4] ,
    \tube1_x[3] ,
    \tube1_x[2] ,
    \tube1_x[1] ,
    \tube1_x[0] ,
    \tube2_x[11] ,
    \tube2_x[10] ,
    \tube2_x[9] ,
    \tube2_x[8] ,
    \tube2_x[7] ,
    \tube2_x[6] ,
    \tube2_x[5] ,
    \tube2_x[4] ,
    \tube2_x[3] ,
    \tube2_x[2] ,
    \tube2_x[1] ,
    \tube2_x[0] ,
    \tube3_x[11] ,
    \tube3_x[10] ,
    \tube3_x[9] ,
    \tube3_x[8] ,
    \tube3_x[7] ,
    \tube3_x[6] ,
    \tube3_x[5] ,
    \tube3_x[4] ,
    \tube3_x[3] ,
    \tube3_x[2] ,
    \tube3_x[1] ,
    \tube3_x[0] ,
    \tube4_x[11] ,
    \tube4_x[10] ,
    \tube4_x[9] ,
    \tube4_x[8] ,
    \tube4_x[7] ,
    \tube4_x[6] ,
    \tube4_x[5] ,
    \tube4_x[4] ,
    \tube4_x[3] ,
    \tube4_x[2] ,
    \tube4_x[1] ,
    \tube4_x[0] ,
    \tube0_h[11] ,
    \tube0_h[10] ,
    \tube0_h[9] ,
    \tube0_h[8] ,
    \tube0_h[7] ,
    \tube0_h[6] ,
    \tube0_h[5] ,
    \tube0_h[4] ,
    \tube0_h[3] ,
    \tube0_h[2] ,
    \tube0_h[1] ,
    \tube0_h[0] ,
    \tube1_h[11] ,
    \tube1_h[10] ,
    \tube1_h[9] ,
    \tube1_h[8] ,
    \tube1_h[7] ,
    \tube1_h[6] ,
    \tube1_h[5] ,
    \tube1_h[4] ,
    \tube1_h[3] ,
    \tube1_h[2] ,
    \tube1_h[1] ,
    \tube1_h[0] ,
    \tube2_h[11] ,
    \tube2_h[10] ,
    \tube2_h[9] ,
    \tube2_h[8] ,
    \tube2_h[7] ,
    \tube2_h[6] ,
    \tube2_h[5] ,
    \tube2_h[4] ,
    \tube2_h[3] ,
    \tube2_h[2] ,
    \tube2_h[1] ,
    \tube2_h[0] ,
    \tube3_h[11] ,
    \tube3_h[10] ,
    \tube3_h[9] ,
    \tube3_h[8] ,
    \tube3_h[7] ,
    \tube3_h[6] ,
    \tube3_h[5] ,
    \tube3_h[4] ,
    \tube3_h[3] ,
    \tube3_h[2] ,
    \tube3_h[1] ,
    \tube3_h[0] ,
    \tube4_h[11] ,
    \tube4_h[10] ,
    \tube4_h[9] ,
    \tube4_h[8] ,
    \tube4_h[7] ,
    \tube4_h[6] ,
    \tube4_h[5] ,
    \tube4_h[4] ,
    \tube4_h[3] ,
    \tube4_h[2] ,
    \tube4_h[1] ,
    \tube4_h[0] ,
    \m4/cnt[3] ,
    \m4/cnt[2] ,
    \m4/cnt[1] ,
    \m4/cnt[0] ,
    vga_vs,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \tube0_x[11] ;
input \tube0_x[10] ;
input \tube0_x[9] ;
input \tube0_x[8] ;
input \tube0_x[7] ;
input \tube0_x[6] ;
input \tube0_x[5] ;
input \tube0_x[4] ;
input \tube0_x[3] ;
input \tube0_x[2] ;
input \tube0_x[1] ;
input \tube0_x[0] ;
input \tube1_x[11] ;
input \tube1_x[10] ;
input \tube1_x[9] ;
input \tube1_x[8] ;
input \tube1_x[7] ;
input \tube1_x[6] ;
input \tube1_x[5] ;
input \tube1_x[4] ;
input \tube1_x[3] ;
input \tube1_x[2] ;
input \tube1_x[1] ;
input \tube1_x[0] ;
input \tube2_x[11] ;
input \tube2_x[10] ;
input \tube2_x[9] ;
input \tube2_x[8] ;
input \tube2_x[7] ;
input \tube2_x[6] ;
input \tube2_x[5] ;
input \tube2_x[4] ;
input \tube2_x[3] ;
input \tube2_x[2] ;
input \tube2_x[1] ;
input \tube2_x[0] ;
input \tube3_x[11] ;
input \tube3_x[10] ;
input \tube3_x[9] ;
input \tube3_x[8] ;
input \tube3_x[7] ;
input \tube3_x[6] ;
input \tube3_x[5] ;
input \tube3_x[4] ;
input \tube3_x[3] ;
input \tube3_x[2] ;
input \tube3_x[1] ;
input \tube3_x[0] ;
input \tube4_x[11] ;
input \tube4_x[10] ;
input \tube4_x[9] ;
input \tube4_x[8] ;
input \tube4_x[7] ;
input \tube4_x[6] ;
input \tube4_x[5] ;
input \tube4_x[4] ;
input \tube4_x[3] ;
input \tube4_x[2] ;
input \tube4_x[1] ;
input \tube4_x[0] ;
input \tube0_h[11] ;
input \tube0_h[10] ;
input \tube0_h[9] ;
input \tube0_h[8] ;
input \tube0_h[7] ;
input \tube0_h[6] ;
input \tube0_h[5] ;
input \tube0_h[4] ;
input \tube0_h[3] ;
input \tube0_h[2] ;
input \tube0_h[1] ;
input \tube0_h[0] ;
input \tube1_h[11] ;
input \tube1_h[10] ;
input \tube1_h[9] ;
input \tube1_h[8] ;
input \tube1_h[7] ;
input \tube1_h[6] ;
input \tube1_h[5] ;
input \tube1_h[4] ;
input \tube1_h[3] ;
input \tube1_h[2] ;
input \tube1_h[1] ;
input \tube1_h[0] ;
input \tube2_h[11] ;
input \tube2_h[10] ;
input \tube2_h[9] ;
input \tube2_h[8] ;
input \tube2_h[7] ;
input \tube2_h[6] ;
input \tube2_h[5] ;
input \tube2_h[4] ;
input \tube2_h[3] ;
input \tube2_h[2] ;
input \tube2_h[1] ;
input \tube2_h[0] ;
input \tube3_h[11] ;
input \tube3_h[10] ;
input \tube3_h[9] ;
input \tube3_h[8] ;
input \tube3_h[7] ;
input \tube3_h[6] ;
input \tube3_h[5] ;
input \tube3_h[4] ;
input \tube3_h[3] ;
input \tube3_h[2] ;
input \tube3_h[1] ;
input \tube3_h[0] ;
input \tube4_h[11] ;
input \tube4_h[10] ;
input \tube4_h[9] ;
input \tube4_h[8] ;
input \tube4_h[7] ;
input \tube4_h[6] ;
input \tube4_h[5] ;
input \tube4_h[4] ;
input \tube4_h[3] ;
input \tube4_h[2] ;
input \tube4_h[1] ;
input \tube4_h[0] ;
input \m4/cnt[3] ;
input \m4/cnt[2] ;
input \m4/cnt[1] ;
input \m4/cnt[0] ;
input vga_vs;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \tube0_x[11] ;
wire \tube0_x[10] ;
wire \tube0_x[9] ;
wire \tube0_x[8] ;
wire \tube0_x[7] ;
wire \tube0_x[6] ;
wire \tube0_x[5] ;
wire \tube0_x[4] ;
wire \tube0_x[3] ;
wire \tube0_x[2] ;
wire \tube0_x[1] ;
wire \tube0_x[0] ;
wire \tube1_x[11] ;
wire \tube1_x[10] ;
wire \tube1_x[9] ;
wire \tube1_x[8] ;
wire \tube1_x[7] ;
wire \tube1_x[6] ;
wire \tube1_x[5] ;
wire \tube1_x[4] ;
wire \tube1_x[3] ;
wire \tube1_x[2] ;
wire \tube1_x[1] ;
wire \tube1_x[0] ;
wire \tube2_x[11] ;
wire \tube2_x[10] ;
wire \tube2_x[9] ;
wire \tube2_x[8] ;
wire \tube2_x[7] ;
wire \tube2_x[6] ;
wire \tube2_x[5] ;
wire \tube2_x[4] ;
wire \tube2_x[3] ;
wire \tube2_x[2] ;
wire \tube2_x[1] ;
wire \tube2_x[0] ;
wire \tube3_x[11] ;
wire \tube3_x[10] ;
wire \tube3_x[9] ;
wire \tube3_x[8] ;
wire \tube3_x[7] ;
wire \tube3_x[6] ;
wire \tube3_x[5] ;
wire \tube3_x[4] ;
wire \tube3_x[3] ;
wire \tube3_x[2] ;
wire \tube3_x[1] ;
wire \tube3_x[0] ;
wire \tube4_x[11] ;
wire \tube4_x[10] ;
wire \tube4_x[9] ;
wire \tube4_x[8] ;
wire \tube4_x[7] ;
wire \tube4_x[6] ;
wire \tube4_x[5] ;
wire \tube4_x[4] ;
wire \tube4_x[3] ;
wire \tube4_x[2] ;
wire \tube4_x[1] ;
wire \tube4_x[0] ;
wire \tube0_h[11] ;
wire \tube0_h[10] ;
wire \tube0_h[9] ;
wire \tube0_h[8] ;
wire \tube0_h[7] ;
wire \tube0_h[6] ;
wire \tube0_h[5] ;
wire \tube0_h[4] ;
wire \tube0_h[3] ;
wire \tube0_h[2] ;
wire \tube0_h[1] ;
wire \tube0_h[0] ;
wire \tube1_h[11] ;
wire \tube1_h[10] ;
wire \tube1_h[9] ;
wire \tube1_h[8] ;
wire \tube1_h[7] ;
wire \tube1_h[6] ;
wire \tube1_h[5] ;
wire \tube1_h[4] ;
wire \tube1_h[3] ;
wire \tube1_h[2] ;
wire \tube1_h[1] ;
wire \tube1_h[0] ;
wire \tube2_h[11] ;
wire \tube2_h[10] ;
wire \tube2_h[9] ;
wire \tube2_h[8] ;
wire \tube2_h[7] ;
wire \tube2_h[6] ;
wire \tube2_h[5] ;
wire \tube2_h[4] ;
wire \tube2_h[3] ;
wire \tube2_h[2] ;
wire \tube2_h[1] ;
wire \tube2_h[0] ;
wire \tube3_h[11] ;
wire \tube3_h[10] ;
wire \tube3_h[9] ;
wire \tube3_h[8] ;
wire \tube3_h[7] ;
wire \tube3_h[6] ;
wire \tube3_h[5] ;
wire \tube3_h[4] ;
wire \tube3_h[3] ;
wire \tube3_h[2] ;
wire \tube3_h[1] ;
wire \tube3_h[0] ;
wire \tube4_h[11] ;
wire \tube4_h[10] ;
wire \tube4_h[9] ;
wire \tube4_h[8] ;
wire \tube4_h[7] ;
wire \tube4_h[6] ;
wire \tube4_h[5] ;
wire \tube4_h[4] ;
wire \tube4_h[3] ;
wire \tube4_h[2] ;
wire \tube4_h[1] ;
wire \tube4_h[0] ;
wire \m4/cnt[3] ;
wire \m4/cnt[2] ;
wire \m4/cnt[1] ;
wire \m4/cnt[0] ;
wire vga_vs;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i({\tube4_x[11] ,\tube4_x[10] ,\tube4_x[9] ,\tube4_x[8] ,\tube4_x[7] ,\tube4_x[6] ,\tube4_x[5] ,\tube4_x[4] ,\tube4_x[3] ,\tube4_x[2] ,\tube4_x[1] ,\tube4_x[0] }),
    .data_i({\tube0_x[11] ,\tube0_x[10] ,\tube0_x[9] ,\tube0_x[8] ,\tube0_x[7] ,\tube0_x[6] ,\tube0_x[5] ,\tube0_x[4] ,\tube0_x[3] ,\tube0_x[2] ,\tube0_x[1] ,\tube0_x[0] ,\tube1_x[11] ,\tube1_x[10] ,\tube1_x[9] ,\tube1_x[8] ,\tube1_x[7] ,\tube1_x[6] ,\tube1_x[5] ,\tube1_x[4] ,\tube1_x[3] ,\tube1_x[2] ,\tube1_x[1] ,\tube1_x[0] ,\tube2_x[11] ,\tube2_x[10] ,\tube2_x[9] ,\tube2_x[8] ,\tube2_x[7] ,\tube2_x[6] ,\tube2_x[5] ,\tube2_x[4] ,\tube2_x[3] ,\tube2_x[2] ,\tube2_x[1] ,\tube2_x[0] ,\tube3_x[11] ,\tube3_x[10] ,\tube3_x[9] ,\tube3_x[8] ,\tube3_x[7] ,\tube3_x[6] ,\tube3_x[5] ,\tube3_x[4] ,\tube3_x[3] ,\tube3_x[2] ,\tube3_x[1] ,\tube3_x[0] ,\tube4_x[11] ,\tube4_x[10] ,\tube4_x[9] ,\tube4_x[8] ,\tube4_x[7] ,\tube4_x[6] ,\tube4_x[5] ,\tube4_x[4] ,\tube4_x[3] ,\tube4_x[2] ,\tube4_x[1] ,\tube4_x[0] ,\tube0_h[11] ,\tube0_h[10] ,\tube0_h[9] ,\tube0_h[8] ,\tube0_h[7] ,\tube0_h[6] ,\tube0_h[5] ,\tube0_h[4] ,\tube0_h[3] ,\tube0_h[2] ,\tube0_h[1] ,\tube0_h[0] ,\tube1_h[11] ,\tube1_h[10] ,\tube1_h[9] ,\tube1_h[8] ,\tube1_h[7] ,\tube1_h[6] ,\tube1_h[5] ,\tube1_h[4] ,\tube1_h[3] ,\tube1_h[2] ,\tube1_h[1] ,\tube1_h[0] ,\tube2_h[11] ,\tube2_h[10] ,\tube2_h[9] ,\tube2_h[8] ,\tube2_h[7] ,\tube2_h[6] ,\tube2_h[5] ,\tube2_h[4] ,\tube2_h[3] ,\tube2_h[2] ,\tube2_h[1] ,\tube2_h[0] ,\tube3_h[11] ,\tube3_h[10] ,\tube3_h[9] ,\tube3_h[8] ,\tube3_h[7] ,\tube3_h[6] ,\tube3_h[5] ,\tube3_h[4] ,\tube3_h[3] ,\tube3_h[2] ,\tube3_h[1] ,\tube3_h[0] ,\tube4_h[11] ,\tube4_h[10] ,\tube4_h[9] ,\tube4_h[8] ,\tube4_h[7] ,\tube4_h[6] ,\tube4_h[5] ,\tube4_h[4] ,\tube4_h[3] ,\tube4_h[2] ,\tube4_h[1] ,\tube4_h[0] ,\m4/cnt[3] ,\m4/cnt[2] ,\m4/cnt[1] ,\m4/cnt[0] }),
    .clk_i(vga_vs)
);

endmodule
