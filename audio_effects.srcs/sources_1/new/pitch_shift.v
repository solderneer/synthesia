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
    input I_sampleclk,
    input [11:0] I_input,
    input [3:0] I_delta,
    input I_filten,
    output [11:0] O_output
    );
    
    wire [11:0] buf1_out;
    wire [11:0] buf2_out;
    wire [11:0] filt_out;
    
    wire sample_flag;
    
    reg [12:0] buf_out;
    
    assign O_output = (I_filten) ? filt_out : buf_out[11:0];
    
    flag_gen sample_flg (I_clk, I_sampleclk, sample_flag);
    butter_filter filt1 (I_clk, buf_out[11:0], sample_flag, 1'b0, filt_out);
    
    pitch_buffer #(.WR_OFFSET(0),.SIZE(1024)) buf1 (I_sampleclk, I_input, I_delta, buf1_out);
    pitch_buffer #(.WR_OFFSET(512),.SIZE(1024)) buf2 (I_sampleclk, I_input, I_delta, buf2_out);

    initial begin
        buf_out = 0;
    end
    
    always @(posedge I_sampleclk) begin
        buf_out <= ((buf1_out + buf2_out) >> 1);
    end
    
    
endmodule
