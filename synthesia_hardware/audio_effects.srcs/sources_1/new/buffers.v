`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2018 15:13:32
// Design Name: 
// Module Name: delay_module
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


module pitch_buffer(
    input I_clk,
    input [11:0] I_microphone,
    input [3:0] I_delta, // Implemented in 2.2 fixed point represenataion
    output reg [11:0] O_buffer
    );
    
    parameter WR_OFFSET = 0;
    parameter SIZE = 1024;
    
    reg [11:0] buffer[(SIZE-1):0];
    reg [($clog2(SIZE)+1):0] rd_ptr; // Implemented in 10.2 fixed point represenation
    reg [($clog2(SIZE)-1):0] wr_ptr;

    integer cnt;
    initial begin
        for(cnt = 0; cnt < SIZE; cnt = cnt + 1) begin
            buffer[cnt] = 0;
        end
        
        O_buffer = 0;
        wr_ptr = WR_OFFSET;
        rd_ptr = 0;
    end
    
    always @(posedge I_clk) begin
        buffer[wr_ptr] <= I_microphone;
        wr_ptr <= wr_ptr + 1;
      
        rd_ptr <= rd_ptr + I_delta; // Add 2 fixed point representations together
        O_buffer <= buffer[rd_ptr[11:2]]; // Condider only integer portion of rd_ptr
    end    
    
endmodule

module delay_buffer(
    input I_clk,
    input [11:0] I_data,
    output reg [11:0] O_data
    );
    
    parameter SIZE = 32768;
    parameter WR_OFFSET = 0;
    
    reg [11:0] buffer[(SIZE-1):0];
    reg [($clog2(SIZE)-1):0] wr_ptr;
    reg [($clog2(SIZE)-1):0] rd_ptr;
    
    integer cnt;
    initial begin
        for(cnt = 0; cnt < SIZE; cnt = cnt + 1) begin
            buffer[cnt] = 0;
        end
        wr_ptr = WR_OFFSET;
        rd_ptr = 0;
        O_data = 0;
    end
    
    always @(posedge I_clk) begin
        O_data <= buffer[rd_ptr];
        buffer[wr_ptr] <= I_data;
        
        rd_ptr <= rd_ptr + 1;
        wr_ptr <= wr_ptr + 1;
    end
endmodule
