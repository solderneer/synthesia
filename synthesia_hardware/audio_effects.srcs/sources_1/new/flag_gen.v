`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2018 11:10:29
// Design Name: 
// Module Name: flag_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module flag_gen(
    input I_clk,
    input I_sig,
    output reg O_flag
    );
    
    reg state, prev_state;
    
    initial begin
        state = 1'b0;
        prev_state = 1'b0;
        O_flag = 1'b0;
    end
    
    always @(posedge I_clk) begin
        state <= I_sig;
        prev_state <= state;
        
        if((prev_state == 1'b1)&&(state == 1'b0)) begin
            O_flag <= 1'b1;
        end
        else begin
            O_flag <= 1'b0;
        end
    end
endmodule
