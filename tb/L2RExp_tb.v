module L2RExp_tb();

reg [15:0] A;
reg [15:0] B;
reg clk;
reg rst;
reg start;
wire [31:0] C;
wire done;


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
    #5 clk = ~clk;
end

initial begin
    $dumpfile("L2RExp_tb.vcd");
    $dumpvars(0, L2RExp_tb);
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
