`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2018 20:13:01
// Design Name: 
// Module Name: signal_gen
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

module sin_signal_gen(
    input I_clk,
    input [2:0] I_octave,
    input [2:0] I_sel,
    output [11:0] O_signal
    );
    
    reg [31:0] rd_ptr; // implemeted in 12.20 fixed point
    
    reg [31:0] delta_c; // 12.20 fixed point notation
    reg [31:0] delta_d;
    reg [31:0] delta_e;
    reg [31:0] delta_f;
    reg [31:0] delta_g;
    reg [31:0] delta_a;
    reg [31:0] delta_b;
    
    sin_lut lut1 (rd_ptr[31:20], O_signal);
    
    initial begin
        rd_ptr = 0;
        
        delta_c = (32'h1ACA5E5); // Calculated increment values using 
        delta_d = (32'h1E12407);
        delta_e = (32'h21C1000);
        delta_f = (32'h23C2CD6);
        delta_g = (32'h2823E9E);
        delta_a = (32'h2D0E560);
        delta_b = (32'h3292D8B);
    end
    
    always @(posedge I_clk) begin
        case(I_sel)
            (3'b001) : rd_ptr <= (I_octave[2]) ? (rd_ptr + (delta_c << I_octave[1:0])) : (rd_ptr + (delta_c >> I_octave[1:0]));
            (3'b010) : rd_ptr <= (I_octave[2]) ? (rd_ptr + (delta_d << I_octave[1:0])) : (rd_ptr + (delta_d >> I_octave[1:0]));
            (3'b011) : rd_ptr <= (I_octave[2]) ? (rd_ptr + (delta_e << I_octave[1:0])) : (rd_ptr + (delta_e >> I_octave[1:0]));
            (3'b100) : rd_ptr <= (I_octave[2]) ? (rd_ptr + (delta_f << I_octave[1:0])) : (rd_ptr + (delta_f >> I_octave[1:0]));
            (3'b101) : rd_ptr <= (I_octave[2]) ? (rd_ptr + (delta_g << I_octave[1:0])) : (rd_ptr + (delta_g >> I_octave[1:0]));
            (3'b110) : rd_ptr <= (I_octave[2]) ? (rd_ptr + (delta_a << I_octave[1:0])) : (rd_ptr + (delta_a >> I_octave[1:0]));
            (3'b111) : rd_ptr <= (I_octave[2]) ? (rd_ptr + (delta_b << I_octave[1:0])) : (rd_ptr + (delta_b >> I_octave[1:0]));
        endcase
    end
endmodule
