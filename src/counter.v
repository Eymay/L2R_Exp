module counter #(
    parameter N = 3
) (
    input rst,
    input clk,
    output [N-1:0] out
);

reg [N-1:0] counter = 0;

always @(posedge clk ) begin
    if(!rst) begin
        counter <= 0;
    else  
        counter <= counter + 1;
    end
end

assign out = counter;



endmodule
