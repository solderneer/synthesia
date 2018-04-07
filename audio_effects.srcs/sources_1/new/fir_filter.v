`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2018 15:39:19
// Design Name: 
// Module Name: butter_filter
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


module fir_filter(
    input I_clk,
    input I_sampleflag,
    input [11:0] I_input,
    output O_rdy,
    output [11:0] O_output
    );
    
    wire in_ready;
     
    pitch_filter filt1 (I_clk, I_sampleflag, in_ready, I_input, O_rdy, O_output);
    
endmodule