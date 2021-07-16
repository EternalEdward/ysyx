module simply (
    input clk,
    input rst,
    input tb,
    input [31:0]tb_inst
);
wire [31:0]s_inst;
wire [63:0]addr;
wire ce;
    top cpu(
        .clk(clk),
        .rst(rst),
        .instaddr(addr),
        .inst_t(s_inst),
        .ce(ce),
        .tb(tb),
        .tb_inst(tb_inst)
    );

    test_rom QAQrom(
        .ce(ce),
        .addr(addr),
        .inst(s_inst)
    );
endmodule