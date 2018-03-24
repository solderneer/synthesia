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
    input [3:0] I_delta,
    output [11:0] O_output
    );
    
    wire [11:0] buf1_out;
    wire [11:0] buf2_out;
    
    reg [12:0] buf_out;
    
    pitch_buffer #(.WR_OFFSET(0),.SIZE(1024)) buf1 (I_clk, I_input, I_delta, buf1_out);
    pitch_buffer #(.WR_OFFSET(512),.SIZE(1024)) buf2 (I_clk, I_input, I_delta, buf2_out);
    
    assign O_output = buf_out[11:0];
    
    initial begin
        buf_out = 0;
    end
    
    always @(posedge I_clk) begin
        buf_out = ((buf1_out + buf2_out) >> 1);
    end
    
    
endmodule
