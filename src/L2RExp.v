module L2RExp #(
parameter k = 16
) (
input [k-1:0] A,
input [k-1:0] B,
input clk,
input rst,
input start,
output [2*k-1:0] C,
output Done
);

wire LoadA;
wire LoadCoun;
wire LoadB;
wire ShiftB;
wire LoadC;
wire S_Coun;
wire [1:0] S_C;
wire equals;
wire regBk;


CU control_unit(.clk(clk), .start(start),
    .equals(equals),.regBk(regBk) , .LoadA(LoadA), 
    .LoadCoun(LoadCoun), .LoadB(LoadB), .ShiftB(ShiftB),
    .LoadC(LoadC), .S_Coun(S_Coun), .S_C(S_C),
    .Done(Done));

L2Rdatapath datapath(.clk(clk), .rst(rst),
    .A(A), .B(B), .LoadA(LoadA), .LoadCoun(LoadCoun),
    .LoadB(LoadB), .ShiftB(ShiftB), .LoadC(LoadC),
    .S_Coun(S_Coun), .S_C(S_C), .RegC(C),
    .start(start), .equals(equals), .regBk(regBk));




endmodule

