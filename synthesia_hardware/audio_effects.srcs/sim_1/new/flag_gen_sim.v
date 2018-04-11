`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2018 11:17:50
// Design Name: 
// Module Name: flag_gen_sim
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


module flag_gen_sim(

    );
    
    reg I_clk, I_rst;
    wire clk_20k, clk_50M;
    wire flag;
    
    clk_gen #(.CLK_DIV(4)) test (I_clk, I_rst, clk_20k, clk_50M);
    flag_gen test1 (clk_50M, clk_20k, flag);
    
    initial begin
        I_clk = 0;
        I_rst = 0; 
    end
    
    always begin
        #5; I_clk = ~I_clk;
    end
endmodule
