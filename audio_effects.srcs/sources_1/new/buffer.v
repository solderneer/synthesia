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


module buffer(
    input I_clk,
    input [11:0] I_microphone,
    input [4:0] I_delta,
    output reg [11:0] O_buffer
    );
    
    reg [11:0] buffer[1023:0];
    reg [10:0] rd_ptr;
    reg [10:0] wr_ptr;
    parameter wr_offset = 0;

    integer cnt;
    
    initial begin
        for(cnt = 0; cnt < 1023; cnt = cnt + 1) begin
            buffer[cnt] = 0;
        end
        
        O_buffer = 0;
        wr_ptr = wr_offset;
        rd_ptr = 0;
    end
    
    always @(posedge I_clk) begin
        buffer[wr_ptr] <= I_microphone;
        O_buffer <= buffer[rd_ptr];
        
        wr_ptr <= wr_ptr + 1;
        // TODO: Implement pitch shift down
        rd_ptr <= rd_ptr + I_delta;
    end
    
endmodule
