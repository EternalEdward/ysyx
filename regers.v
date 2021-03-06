module regs (
    input clk,
    input rst,

    input [4:0]raddr1,
    input [4:0]raddr2,
    input wen,
    input [63:0]wdata,
    input [4:0]waddr,

    output [63:0]rdata1,
    output [63:0]rdata2
);
reg [63:0] regs[0:31];
always @(posedge clk) begin
    if(rst==1'b1)begin
      regs[ 0] <= 64'h0000000000000000;
      regs[ 1] <= 64'h0000000000000000;
      regs[ 2] <= 64'h0000000000000000;
      regs[ 3] <= 64'h0000000000000000;
      regs[ 4] <= 64'h0000000000000000;
      regs[ 5] <= 64'h0000000000000000;
      regs[ 6] <= 64'h0000000000000000;
      regs[ 7] <= 64'h0000000000000000;
      regs[ 8] <= 64'h0000000000000000;
      regs[ 9] <= 64'h0000000000000000;
      regs[10] <= 64'h0000000000000000;
      regs[11] <= 64'h0000000000000000;
      regs[12] <= 64'h0000000000000000;
      regs[13] <= 64'h0000000000000000;
      regs[14] <= 64'h0000000000000000;
      regs[15] <= 64'h0000000000000000;
      regs[16] <= 64'h0000000000000000;
      regs[17] <= 64'h0000000000000000;
      regs[18] <= 64'h0000000000000000;
      regs[19] <= 64'h0000000000000000;
      regs[20] <= 64'h0000000000000000;
      regs[21] <= 64'h0000000000000000;
      regs[22] <= 64'h0000000000000000;
      regs[23] <= 64'h0000000000000000;
      regs[24] <= 64'h0000000000000000;
      regs[25] <= 64'h0000000000000000;
      regs[26] <= 64'h0000000000000000;
      regs[27] <= 64'h0000000000000000;
      regs[28] <= 64'h0000000000000000;
      regs[29] <= 64'h0000000000000000;
      regs[30] <= 64'h0000000000000000;
      regs[31] <= 64'h0000000000000000;

    end
    if(wen)begin
        regs[waddr] <= wdata;
    end
end
assign rdata1 = (raddr1 != 5'b00000 ) ? regs[raddr1] : 64'h0000000000000000;
assign rdata2 = (raddr2 != 5'b00000 ) ? regs[raddr2] : 64'h0000000000000000;
endmodule