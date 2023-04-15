module L2Rdatapath #(parameter k = 16) (
input clk,
input rst,
input [k-1:0] A,
input [k-1:0] B,
input LoadA,
input LoadCoun,
input LoadB,
input ShiftB,
input LoadC,
input S_Coun,
input [1:0] S_C,
output [2*k-1:0] RegC,
output start,
output equals,
output regBk
);
wire [k-1:0]  N;
reg [k-1:0] C_Input;
wire [k-1:0] RegA, RegB, RegN;
wire  ShiftC;

dff #(.k(k)) RegisterA(.clk(clk), .rst(rst),
    .D(A), .En(LoadA), .Q(RegA));
dff #(.k(k)) RegisterN(.clk(clk), .rst(rst),
    .D(N), .En(LoadN), .Q(RegN));

shiftFF #(.k(k)) RegisterB(.clk(clk), .rst(rst),
    .D(B), .En(LoadB), .Shift(ShiftB), .Q(RegB));
shiftFF #(.k(k)) RegisterC(.clk(clk), .rst(rst),
    .D(C_Input), .En(LoadC), .Shift(ShiftC), .Q(RegC));

reg [$clog2(k):0] CounterInput;
reg [$clog2(k):0] Counter;

always @(posedge clk) begin
    if(!rst)
        Counter <= k + 1;
    else if(LoadCoun)
        Counter <= CounterInput;
end


/*
counter #(.k($clog2(k))) Counter1(.clk(clk), .rst(rst),
    .en(LoadCoun), .counter_in(CounterInput), .out(Counter));
*/



wire [k-1:0] k_1, ResultSUB1;

assign k_1 = k - 1;

always @(*) begin
    if(S_Coun)
        CounterInput <= ResultSUB1;
    else
        CounterInput <= k + 1;
end

wire [2*k-1:0] ResultSQUARE, ResultMUL;

always @(*) begin
    case(S_C)
        2'b00:
            C_Input <= 1;
        2'b01:
            C_Input <= ResultSQUARE;
        2'b10:
            C_Input <= ResultMUL;
        default:
            C_Input <= 0;
    endcase
end

assign equals = (Counter == 0);

assign regBk = RegB[k-1];

assign ResultSUB1 = Counter - 1;

MUL MultiplierSq(.X(RegC), .Y(RegC), .P(ResultSQUARE));

MUL MultiplierAC(.X(RegC), .Y(RegA), .P(ResultMUL));


endmodule

