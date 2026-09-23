// GMII IO — 1G 8bit / 10/100M 4bit SDR 双模式
//260812    v1.0.0   初始版本
//260822    v1.1.0   增加10/100M低4位SDR模式，P_RGMII_MODE选择
//260823    v1.1.1   1G模式下打拍增加稳定性
module gmii_io #(
    parameter [ 1:0] P_RGMII_MODE = 2'd2  // 0:10M SDR 4bit, 1:100M SDR 4bit, 2:1G 8bit
) (
    input                               i_rst_n,
    // GMII 引脚侧
    input                               i_gmii_rx_clk,
    input                               i_gmii_rx_valid,
    input                               i_gmii_rx_err,
    input                       [ 7:0]  i_gmii_rx_data,
    output      logic                   o_gmii_tx_clk,
    output      logic                   o_gmii_tx_valid,
    output      logic                   o_gmii_tx_err,
    output      logic           [ 7:0]  o_gmii_tx_data,
    // User GMII
    output      logic                   o_usr_clk,
    output      logic           [ 7:0]  o_rx_data,
    output      logic                   o_rx_dv,
    output      logic                   o_rx_er,
    input                       [ 7:0]  i_tx_data,
    input                               i_tx_en,
    input                               i_tx_er
);

generate
    /////////////////////////////////////////////////////////////////////////////
    // 1G 模式：保持原代码，8bit GMII 直通
    /////////////////////////////////////////////////////////////////////////////
    if (P_RGMII_MODE == 2'd2) begin : gen_gmii_1g
        assign o_usr_clk      = ~i_gmii_rx_clk;
        assign o_gmii_tx_clk  = o_usr_clk;

        // RX 输入打一拍，避免亚稳态
        always_ff @(posedge o_usr_clk) begin
            if (!i_rst_n) begin
                o_rx_data <= 8'h00;
                o_rx_dv   <= 1'b0;
                o_rx_er   <= 1'b0;
            end else begin
                o_rx_data <= i_gmii_rx_data;
                o_rx_dv   <= i_gmii_rx_valid;
                o_rx_er   <= i_gmii_rx_err;
            end
        end

        // TX 输出打一拍，与 o_gmii_tx_clk 对齐
        always_ff @(posedge o_gmii_tx_clk) begin
            if (!i_rst_n) begin
                o_gmii_tx_data  <= 8'h00;
                o_gmii_tx_err   <= 1'b0;
                o_gmii_tx_valid <= 1'b0;
            end else begin
                o_gmii_tx_data  <= i_tx_data;
                o_gmii_tx_err   <= i_tx_er;
                o_gmii_tx_valid <= i_tx_en;
            end
        end
    end else begin : gen_gmii_10_100
        /////////////////////////////////////////////////////////////////////////////
        // 10/100M 模式：USR CLK 二分频，仅使用GMII低4位，两个dv拼一个字节
        /////////////////////////////////////////////////////////////////////////////
        logic                           usr_clk_div;
        logic [3:0]                     rxd_q;
        logic                           rxdv_q;
        logic [3:0]                     rxd_lo;
        logic                           rxdv_lo;
        logic                           rx_phase;
        logic                           rxdv_sdr_prev;
        logic                           rx_skip_first;
        logic [7:0]                     rx_data_rxc;
        logic                           rx_dv_rxc;
        logic                           rx_er_rxc;
        logic [7:0]                     tx_data_usr;
        logic                           tx_en_usr;
        logic                           tx_er_usr;
        logic [7:0]                     tx_data_q;
        logic                           tx_en_q;
        logic                           tx_er_q;

        assign o_usr_clk = usr_clk_div;

        // 用户时钟：RXC 2分频
        always_ff @(posedge i_gmii_rx_clk) begin
            if (!i_rst_n)
                usr_clk_div <=  1'b0;
            else
                usr_clk_div <= ~usr_clk_div;
        end

        // RX 输入先在 RXC 域打一拍
        always_ff @(posedge i_gmii_rx_clk) begin
            if (!i_rst_n) begin
                rxd_q  <= 4'd0;
                rxdv_q <= 1'b0;
            end else begin
                rxd_q  <= i_gmii_rx_data[3:0];
                rxdv_q <= i_gmii_rx_valid;
            end
        end

        // 半字节拼接：第一个 dv 为低4位，第二个 dv 为高4位
        always_ff @(posedge i_gmii_rx_clk) begin
            if (!i_rst_n) begin
                rx_phase       <= 1'b0;
                rxd_lo         <= 4'd0;
                rxdv_lo        <= 1'b0;
                rxdv_sdr_prev  <= 1'b0;
                rx_skip_first  <= 1'b0;
                rx_data_rxc    <= 8'h00;
                rx_dv_rxc      <= 1'b0;
                rx_er_rxc      <= 1'b0;
            end else begin
                rxdv_sdr_prev <= rxdv_q;

                if (!rxdv_q) begin
                    // 帧结束：复位拼接状态，避免 o_rx_dv 持续拉高
                    rx_skip_first <= 1'b0;
                    rx_phase      <= 1'b0;
                    rx_dv_rxc     <= 1'b0;
                    rx_er_rxc     <= 1'b0;
                end else if (rxdv_q && !rxdv_sdr_prev) begin
                    // dv 上升沿：本拍是字节的低4位
                    if ((P_RGMII_MODE == 2'd0) && !rx_skip_first) begin
                        // 10M：扔掉第一个dv对应的数据
                        rx_skip_first <= 1'b1;
                        rx_phase      <= 1'b0;
                    end else begin
                        rx_phase <= 1'b1;
                        rxd_lo   <= rxd_q;
                        rxdv_lo  <= rxdv_q;
                    end
                end else if (!rx_phase) begin
                    // 低4位
                    if ((P_RGMII_MODE == 2'd0) && !rx_skip_first) begin
                        rx_skip_first <= 1'b1;
                        rx_phase      <= 1'b0;
                    end else begin
                        rx_phase <= 1'b1;
                        rxd_lo   <= rxd_q;
                        rxdv_lo  <= rxdv_q;
                    end
                end else begin
                    // 高4位：拼成一个字节
                    rx_phase    <= 1'b0;
                    rx_data_rxc <= {rxd_q, rxd_lo};
                    rx_dv_rxc   <= rxdv_q && rxdv_lo;
                    rx_er_rxc   <= 1'b0;
                end
            end
        end

        // RX 输出在 o_usr_clk 域重采样
        always_ff @(posedge usr_clk_div) begin
            if (!i_rst_n) begin
                o_rx_data <= 8'h00;
                o_rx_dv   <= 1'b0;
                o_rx_er   <= 1'b0;
            end else begin
                o_rx_data <= rx_data_rxc;
                o_rx_dv   <= rx_dv_rxc;
                o_rx_er   <= rx_er_rxc;
            end
        end

        // TX：8bit -> 低4位 SDR 串行化
        always_ff @(posedge usr_clk_div) begin
            if (!i_rst_n) begin
                tx_data_usr <= 8'h00;
                tx_en_usr   <= 1'b0;
                tx_er_usr   <= 1'b0;
            end else begin
                tx_data_usr <= i_tx_data;
                tx_en_usr   <= i_tx_en;
                tx_er_usr   <= i_tx_er;
            end
        end

        always_ff @(posedge i_gmii_rx_clk) begin
            if (!i_rst_n) begin
                o_gmii_tx_data  <= 8'h00;
                o_gmii_tx_valid <= 1'b0;
                o_gmii_tx_err   <= 1'b0;
                tx_data_q       <= 8'h00;
                tx_en_q         <= 1'b0;
                tx_er_q         <= 1'b0;
            end else begin
                if (!usr_clk_div) begin
                    // 低4位
                    o_gmii_tx_data  <= {4'd0, tx_data_q[3:0]};
                    o_gmii_tx_valid <= tx_en_q;
                    o_gmii_tx_err   <= 1'b0;
                end else begin
                    // 高4位，并锁存 o_usr_clk 域打拍后的下一字节
                    o_gmii_tx_data  <= {4'd0, tx_data_q[7:4]};
                    o_gmii_tx_valid <= tx_en_q;
                    o_gmii_tx_err   <= tx_er_q;
                    tx_data_q       <= tx_data_usr;
                    tx_en_q         <= tx_en_usr;
                    tx_er_q         <= tx_er_usr;
                end
            end
        end

        assign o_gmii_tx_clk = i_gmii_rx_clk;
    end
endgenerate

endmodule
