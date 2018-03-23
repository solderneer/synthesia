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
    input I_deltaop,
    output reg [11:0] O_output
    );
    
    wire [11:0] buf1_out;
    wire [11:0] buf2_out;
    wire clk_final;
    wire delta_clk;
    wire [3:0] delta_val;
    reg [3:0] delta_pitch;
    
    assign clk_final = (I_deltaop) ? delta_clk : I_clk;
    assign delta_val[3:0] = (I_deltaop) ? 4'd1 : I_delta[3:0];
    
    pitch_buffer #(.wr_offset(0)) buf1 (I_clk, clk_final, I_input, delta_val, buf1_out);
    pitch_buffer #(.wr_offset(8)) buf2 (I_clk, clk_final, I_input, delta_val, buf2_out);
    clk_divider div (I_clk, I_delta, delta_clk);
    
    initial begin
        O_output = 0;
    end
    
    always @(posedge I_clk) begin
        O_output = ((buf1_out + buf2_out) >> 1);
    end
    
    
endmodule
