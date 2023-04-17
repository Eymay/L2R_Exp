module dff #(
parameter k = 16
) (
    input clk,
    input rst,
    input [k-1:0] D,
    input En,
    output reg [k-1:0] Q
);

always @(negedge clk ) begin
    if(!rst)
        Q <= 0;
    else if(En) 
        Q <= D;

end
endmodule
