/*
 *  SVO - Simple Video Out FPGA Core
 *
 *  Copyright (C) 2014  Clifford Wolf <clifford@clifford.at>
 *  
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *  
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

module svo_hdmi (
    input               i_clk,
    input               i_clk_5x,
    input               i_rst_n,

    //外部视频输入
    input               i_hs,
    input               i_vs,
    input               i_de,
    input  [23:0]       i_data,

    //TMDS差分输出
    output              o_tmds_clk_n, o_tmds_clk_p,
    output [2:0]        o_tmds_d_n,   o_tmds_d_p
);

//复位同步到像素时钟域
reg [3:0] resetn_clk_pixel_q;

always @(posedge i_clk) begin
    resetn_clk_pixel_q <= {resetn_clk_pixel_q[2:0], i_rst_n};
end

wire clk_pixel_resetn = resetn_clk_pixel_q[3];

wire [2:0] tmds_d;
wire [2:0] tmds_d0, tmds_d1, tmds_d2, tmds_d3, tmds_d4;
wire [2:0] tmds_d5, tmds_d6, tmds_d7, tmds_d8, tmds_d9;

svo_tmds svo_tmds_0 (
    .clk    (i_clk        ),
    .resetn (clk_pixel_resetn   ),
    .de     (i_de               ),
    .ctrl   ({i_vs, i_hs}       ),
    .din    (i_data[23:16]      ),
    .dout   ({tmds_d9[0], tmds_d8[0], tmds_d7[0], tmds_d6[0], tmds_d5[0],
              tmds_d4[0], tmds_d3[0], tmds_d2[0], tmds_d1[0], tmds_d0[0]})
);

svo_tmds svo_tmds_1 (
    .clk    (i_clk        ),
    .resetn (clk_pixel_resetn   ),
    .de     (i_de               ),
    .ctrl   (2'b0               ),
    .din    (i_data[15:8]       ),
    .dout   ({tmds_d9[1], tmds_d8[1], tmds_d7[1], tmds_d6[1], tmds_d5[1],
              tmds_d4[1], tmds_d3[1], tmds_d2[1], tmds_d1[1], tmds_d0[1]})
);

svo_tmds svo_tmds_2 (
    .clk    (i_clk        ),
    .resetn (clk_pixel_resetn   ),
    .de     (i_de               ),
    .ctrl   (2'b0               ),
    .din    (i_data[7:0]        ),
    .dout   ({tmds_d9[2], tmds_d8[2], tmds_d7[2], tmds_d6[2], tmds_d5[2],
              tmds_d4[2], tmds_d3[2], tmds_d2[2], tmds_d1[2], tmds_d0[2]})
);

OSER10 tmds_serdes [2:0] (
    .Q     (tmds_d             ),
    .D0    (tmds_d0            ),
    .D1    (tmds_d1            ),
    .D2    (tmds_d2            ),
    .D3    (tmds_d3            ),
    .D4    (tmds_d4            ),
    .D5    (tmds_d5            ),
    .D6    (tmds_d6            ),
    .D7    (tmds_d7            ),
    .D8    (tmds_d8            ),
    .D9    (tmds_d9            ),
    .PCLK  (i_clk        ),
    .FCLK  (i_clk_5x     ),
    .RESET (~clk_pixel_resetn  )
);

ELVDS_OBUF tmds_bufds [3:0] (
    .I  ({i_clk, tmds_d}      ),
    .O  ({o_tmds_clk_p, o_tmds_d_p} ),
    .OB ({o_tmds_clk_n, o_tmds_d_n} )
);

endmodule
