module  mux_2_64(
    input [63:0]x,//1
    input [63:0]y,//0
    input sel,
    output [63:0]z
);
assign z = sel ? x : y;

endmodule