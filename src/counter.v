module counter #(
    parameter k = 3
) (
    input rst,
    input clk,
    input en,
    input [k-1:0] counter_in,
    output [k-1:0] out
);

reg [k-1:0] counter;

always @(negedge clk ) begin
    if(rst || !en)   
        counter <= counter - 1;
end

always@(*) begin
    if(!rst) 
        counter <= 0;
    else if(en) 
        counter <= counter_in;
end



assign out = counter;



endmodule
