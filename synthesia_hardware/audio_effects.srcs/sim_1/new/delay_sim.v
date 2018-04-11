`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2018 16:22:30
// Design Name: 
// Module Name: delay_sim
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


module delay_sim(

    );
// Tested with a variant of the delay_buffer which is only 8 bits long

    reg clk;
    reg [11:0] I_data;
    wire [11:0] O_data;

    delay_buffer buff (clk, I_data, O_data);

    initial begin
        clk = 0;
        I_data = 0;
        
        #7; I_data = 11'd0;
        #10; I_data = 11'd1;
        #10; I_data = 11'd2;
        #10; I_data = 11'd3;
        #10; I_data = 11'd4;
        #10; I_data = 11'd5;
        #10; I_data = 11'd6;
        #10; I_data = 11'd7;
        #10; I_data = 11'd8;
        #10; I_data = 11'd9;
        #10; I_data = 11'd10;
        #10; I_data = 11'd11;
        #10; I_data = 11'd12;
    end
    
    always begin
        #5; clk = ~clk;
    end


endmodule
