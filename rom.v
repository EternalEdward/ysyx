module test_rom (
    input wire ce,
    input wire [63:0]addr,
    output reg[31:0]inst
);
    reg[31:0]  mem[0:63];
    //待会初始化
    initial 
    begin
        $readmemh("C:/Users/Eternal/Desktop/QAQ/inst.data",mem);
    end 
    always @(*)begin      
        if(ce == 1'b0)begin
            inst <= 32'h00000000;
        end else begin
            inst <=  mem[addr[18:2]];
        end
    end
endmodule