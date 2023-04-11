module CU_tb();
reg clk;
reg start;
reg equals;
reg prevRegB;
wire LoadA;
wire LoadCoun;
wire LoadB;
wire ShiftB;
wire LoadC;
wire S_Coun;
wire [1:0] S_C;

    always begin
        #1 clk = ~clk;
    end

CU CU_inst(
    .clk(clk),
    .start(start),
    .equals(equals),
    .prevRegB(prevRegB),
    .LoadA(LoadA),
    .LoadCoun(LoadCoun),
    .LoadB(LoadB),
    .ShiftB(ShiftB),
    .LoadC(LoadC),
    .S_Coun(S_Coun),
    .S_C(S_C)
);

initial begin
    $dumpfile("CU_tb.vcd");
    $dumpvars(0, CU_tb);
    clk = 0;
    start = 0;
    equals = 0;
    prevRegB = 0;
    #10;
    start = 1;
    #10;
    start = 0;
    #10;
    equals = 1;
    #10;
    equals = 0;
    #10;
    prevRegB = 1;
    #10;
    prevRegB = 0;
    #10;
    $finish;
end

endmodule
