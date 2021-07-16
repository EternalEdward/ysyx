module decoder (
    input [31:0]inst,
    output reg[1:0]aluop,
    output reg wen,
    output reg mux_imm_rdata2_sel
);
wire [6:0]opcode;
wire [2:0]funct;
wire [11:0]imm;
assign opcode = inst[6:0];
assign funct = inst[14:12];
assign imm = inst[31:20];
    always @(*) begin
        case (opcode)
            6'b0010011:              //I  ALU 的多路选择器到时候B选imm
                case (funct)          //目前为了赶DDL，多路选择器先不放进去（记得要放！！！！）
                    3'b111: 
                    begin 
                        aluop <= 2'b00;//+  结果写入 x[rd]。忽略算术溢出。
                        wen <= 1'b1;
                        mux_imm_rdata2_sel <=1'b1;//imm
                    end
                    //default: 
                endcase
            //default: 
        endcase
    end
endmodule