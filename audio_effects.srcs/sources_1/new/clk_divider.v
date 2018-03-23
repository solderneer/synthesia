`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2018 14:13:58
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input I_clk,
    input [3:0] I_delta,
    output O_clk
    );
    
    reg [15:0] cnt;
    
    assign O_clk = cnt[I_delta];
    
    initial begin
        cnt = 0;
    end 
    
    always @(posedge I_clk) begin
        cnt <= cnt + 1;
    end

endmodule
