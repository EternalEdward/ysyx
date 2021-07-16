module pc (
    input clk,
    output reg ce,
    input rst,
    output reg[63:0]pc
);
always @(posedge clk) begin
    if (rst == 1'b1) begin
      ce <= 1'b0;
    end
    else begin
      ce <= 1'b1;
    end
end

always @(posedge clk)begin
    if(rst == 1'b1 || ce == 1'b0) begin
      pc <= 63'h0000000000000000;
    end
    else begin 
      pc <= pc + 4'h4;
    end
end
endmodule