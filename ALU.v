module ALU (
    input [63:0] x,
    input [63:0] y,
    input [1:0]aluop,
    output reg[63:0] z
);
always @(*) begin
    case (aluop)
        2'b00: z <= x + y;
        2'b01: z <= x | y;
        2'b10: z <= x - y;
        default: z <= 64'h0000000000000000;
    endcase
end
endmodule