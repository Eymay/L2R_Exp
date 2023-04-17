module CU_tb();
reg clk;
reg start;
reg equals;
reg regBk;
wire LoadA;
wire LoadCoun;
wire LoadB;
wire ShiftB;
wire LoadC;
wire S_Coun;
wire [1:0] S_C;

    always begin
        #5 clk = ~clk;
    end

CU CU_inst(
    .clk(clk),
    .start(start),
    .equals(equals),
    .regBk(regBk),
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
    clk = 1;
    start = 0;
    equals = 0;
    regBk = 0;
    //Step 1 to Step 2
    #20 start = 1;

    //Step 2 to Step 3
    #10 equals = 0;

    //Step 2 to Step 1
    #10 equals = 1;
    //Step 3 to Step 4 
    //has no condition

    //Step 4 to Step 5
    #10 regBk = 1;

    //Step 5 to Step 2 
    //has no condition

    //Step 2 to Step 3
    #10 equals = 0;

    #10 regBk = 0;
    #10 start = 1;
    #10 equals = 1;
    #10 start = 0;
    #10 equals = 0;
    $finish;
end

endmodule
