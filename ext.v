module ext (
    input [11:0]imm,
    output [63:0]result
);
//  后期要增加剩余多种拓展
assign result = {{52{imm[11]}},imm};//有符号ext
    //符号位扩展的立即数
endmodule