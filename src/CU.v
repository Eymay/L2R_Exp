module CU(
input clk,
input start,
input equals,
input regBk,
output LoadA,
output LoadCoun,
output LoadB,
output ShiftB,
output LoadC,
output S_Coun,
output [1:0] S_C,
output reg Done
);
parameter   STEP1 = 3'b001,
            STEP2 = 3'b010,
            STEP3 = 3'b011,
            STEP4 = 3'b100,
            STEP5 = 3'b101;

reg [2:0] state = STEP1;

reg [7:0] control_word;
assign {LoadA, LoadCoun, LoadB, ShiftB, LoadC, S_Coun, S_C} = control_word;
always@(posedge clk) begin 
        case(state)
            STEP1: 
                if(!start) begin
                    control_word <= 8'b00001000;
                    state <= STEP1;
                    Done <= 0;
                end else begin
                    control_word <= 8'b11101000;
                    state <= STEP2;
                end
            STEP2: 
                if(!equals) begin
                    control_word <= 8'b01001101;
                    state <= STEP3;
                end else begin
                    control_word <= 8'b01000100;
                    state <= STEP1; 
                    Done <= 1;
                end
            
            STEP3: begin
                control_word <= 8'b00000000;
                state <= STEP4;
            end
            STEP4:
                if(!regBk) begin
                    control_word <= 8'b00010000;
                    state <= STEP2;
                end else begin
                    control_word <= 8'b00011010;
                    state <= STEP5;
                end
            STEP5: begin
                control_word <= 8'b00000000;
                state <= STEP2;
            end
        endcase
    end


endmodule
