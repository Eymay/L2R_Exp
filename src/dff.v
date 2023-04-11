module dff (
    input clk,
    input rst,
    input D,
    input En,
    output reg Q
);

always @(posedge clk ) begin
    if(En) begin
        if(!rst)
            Q <= 0;
        else
            Q <=D;
    end
end
endmodule
