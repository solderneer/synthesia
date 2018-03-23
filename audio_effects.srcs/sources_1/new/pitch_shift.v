`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2018 18:42:59
// Design Name: 
// Module Name: pitch_shift
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


module pitch_shift(
    input I_clk,
    input [11:0] I_input,
    input [4:0] I_delta,
    output reg [11:0] O_output
    );
    
    wire [11:0] buf1_out;
    wire [11:0] buf2_out;
    
    pitch_buffer #(.wr_offset(0)) buf1 (I_clk, I_input, I_delta, buf1_out);
    pitch_buffer #(.wr_offset(8)) buf2 (I_clk, I_input, I_delta, buf2_out);
    
    initial begin
        O_output = 0;
    end
    
    always @(posedge I_clk) begin
        O_output = ((buf1_out + buf2_out) >> 1);
    end
    
    
endmodule
