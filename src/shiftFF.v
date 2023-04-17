module shiftFF #(
parameter k = 16
)(
    input clk, 
    input rst,
    input [k-1:0]D,
    input En,
    input Shift, 
    output reg [k-1:0] Q
);
always @(posedge clk ) begin
    if(!rst)
        Q <= 0;
    else if(En)
        Q <= D;
    else if(Shift)
        Q <= Q << 1;
end

endmodule
