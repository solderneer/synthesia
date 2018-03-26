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


module signal_gen(
    input I_clk,
    output [11:0] O_signal
    );
    
    reg [31:0] rd_ptr; // implemeted in 12.20 fixed point
    reg [31:0] delta; // 12.20 fixed point notation
    
    dist_mem_gen_0 lut1 (rd_ptr[31:20], O_signal);
    
    initial begin
        rd_ptr = 0;
        delta = 32'h03594BCC;
    end
    
    always @(posedge I_clk) begin
        rd_ptr = rd_ptr + delta;
    end
endmodule
