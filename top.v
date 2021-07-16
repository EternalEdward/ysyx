module top (
    input clk,
    input rst,

    //input [31:0]inst,
    input [31:0]inst_t,

    output [63:0]instaddr,
    output ce,

    input [31:0]tb,
    input [31:0]tb_inst
);//连CPU的数据通路 
//pc
//由于时间原因我节省了很多模块，写的有点拉胯

wire [63:0]Scure_A;
wire [63:0]Scure_B;
wire [63:0]rdata2;
reg [31:0]inst;
wire wen;
wire mux_imm_rdata2_sel;
wire [1:0]aluop;
wire [11:0]imm;//先解决12位的imm,
assign imm = inst[31:20];
wire [63:0]after_ext_imm;
wire [63:0]ALU_result;

always @(*)begin
    if(tb == 1'b1)begin
        inst <= tb_inst;
    end
    else begin
        inst <= inst_t;
    end
end


pc pc_s(
    .clk(clk),
    .ce(ce),
    .rst(rst),
    .pc(instaddr)
);

//decoder
decoder decoder(
    .inst(inst),
    .aluop(aluop),
    .wen(wen),
    .mux_imm_rdata2_sel(mux_imm_rdata2_sel)
);

//regfile

regs regfile(
    .clk(clk),
    .rst(rst),

    .raddr1(inst[19:15]),
    .raddr2(inst[24:20]),
    .wen(wen),
    .wdata(ALU_result),//input //后期加多路选择器再改
    .waddr(inst[11:6]),

    .rdata1(Scure_A),
    .rdata2(rdata2)
);

ext ext_immaddi(
    .imm(imm),
    .result(after_ext_imm)
);

mux_2_64 mux_imm_rdata2(
    .x(after_ext_imm),//1
    .y(rdata2),//0
    .sel(mux_imm_rdata2_sel),
    .z(Scure_B)
);

//alu
ALU alu(
    .x(Scure_A),//A
    .y(Scure_B),//准备后期当B端用
    .aluop(aluop),
    .z(ALU_result)
);

endmodule