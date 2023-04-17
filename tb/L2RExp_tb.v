module L2RExp_tb();

reg [15:0] A;
reg [15:0] B;
reg [15:0] expected;
reg clk;
reg rst;
reg start;
wire [31:0] C;
wire done;

reg [47:0] test_vec [254:0];

L2RExp dut(
.clk(clk),
.rst(rst),
.Done(done),
.A(A),
.B(B),
.C(C),
.start(start)
);

always  begin
    #15 clk = ~clk;
end

initial begin
    $dumpfile("L2RExp_tb.vcd");
    $dumpvars(0, L2RExp_tb);
    $readmemh("L2RExp_tb.hex", test_vec);
    clk = 1;
    rst = 0;
    start = 0;
    #40 rst = 1;

    for(int i=0; i<255; i=i+1) begin
        {A, B, expected} = test_vec[i];
        #50 start = 1;
        #50 start = 0;
        //#550;
    wait(done);
        
    if(C != expected) begin
            $display("Test failed at %d", i);
            $display("A = %d, B = %d, expected = %d, actual = %d", A, B, expected, C);
        end
    else
            $display("PASSED A = %d, B = %d, expected = %d", A, B, expected, C);
    #20;
    
    
    end
    
    A = 16'd2;
    B = 16'd14;
    clk = 1;
    rst = 0;
    start = 0;
    #10 rst = 1;
    #15;
    start = 1;

#50;
    A = 16'd5;
    B = 16'd6;

#500;
$finish;

end
endmodule
