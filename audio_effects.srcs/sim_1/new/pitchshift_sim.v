`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2018 19:11:15
// Design Name: 
// Module Name: pitchshift_sim
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


module pitchshift_sim(

    );
    
    reg I_clk;
    reg [11:0] I_input;
    reg [4:0] I_delta;
    wire [11:0] O_output;
    
    pitch_shift pit1 (I_clk, I_input, I_delta, O_output);
    
    initial begin
        I_clk = 0;
        I_input = 0;
        I_delta = 2;
        
        #7; I_input = 12'd1;
        #10; I_input = 12'd2;
        #10; I_input = 12'd3;
        #10; I_input = 12'd4;
        #10; I_input = 12'd5;
        #10; I_input = 12'd6;
        #10; I_input = 12'd7;
        #10; I_input = 12'd8;
    end
    
    always begin
        #5; I_clk = ~I_clk;
    end
endmodule
