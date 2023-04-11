module shiftFF (
    input clk, 
    input rst,
    input D,
    input En,
    input Shift, 
    output reg Q
);
    always @(posedge clk ) begin
    if(En) begin
        if(!rst)
            Q <= 0;
        else if(En)
            Q <= D;
        else if(Shift)
            Q <= Q << 1;
    end

endmodule
