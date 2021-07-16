`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/15 22:56:31
// Design Name: 
// Module Name: QAQtb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module QAQtb();
reg clk;
reg rst;
reg tb;
reg [31:0]tb_inst;
initial begin
    clk = 1'b1;
    tb = 1'b1;
    rst = 1'b1;
    tb_inst = 32'h00100093;
    #100
    rst = 1'b0;
    forever #20 clk=~clk;
end
simply QAQ(
    .clk(clk),
    .rst(rst),
    .tb(tb),
    .tb_inst(tb_inst)
);
endmodule

