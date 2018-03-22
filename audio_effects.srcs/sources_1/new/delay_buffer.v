`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2018 16:12:53
// Design Name: 
// Module Name: delay_buffer
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
// A delay buffer that delays the output by 32767 cycles
//////////////////////////////////////////////////////////////////////////////////


module delay_buffer(
    input I_clk,
    input [11:0] I_data,
    output reg [11:0] O_data
    );
    
    reg [11:0] buffer[32767:0];
    reg [14:0] wr_ptr;
    reg [14:0] rd_ptr;
    
    integer cnt;
    
    initial begin
        for(cnt = 0; cnt < 32767; cnt = cnt + 1) begin
            buffer[cnt] = 0;
        end
        wr_ptr = 15'd32767;
        rd_ptr = 15'd0;
        O_data = 0;
    end
    
    always @(posedge I_clk) begin
        O_data <= buffer[rd_ptr];
        buffer[wr_ptr] <= I_data;
        
        rd_ptr <= rd_ptr + 1;
        wr_ptr <= wr_ptr + 1;
    end
endmodule
