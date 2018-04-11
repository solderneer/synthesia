`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2018 21:21:01
// Design Name: 
// Module Name: inst_decoder
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


module inst_decoder(
    input I_clk,
    input [7:0] I_inst,
    input I_rdy,
    output reg [3:0] O_en,
    output reg [2:0] O_octsel,
    output reg [2:0] O_notesel,
    output reg O_filten,
    output reg [3:0] O_delta
    );
    
    initial begin
        O_en = 0;
        O_octsel = 0;
        O_notesel = 0;
        O_filten = 0;
        O_delta = 0;
    end
    
    always @(posedge I_clk) begin
        if(I_rdy) begin
            O_en[0] <= (I_inst[7:6] == 2'b01); // Check for passthrough mode
            O_en[1] <= (I_inst[7:5] == 3'b100); // Check for voice delay mode
            O_en[2] <= (I_inst[7:5] == 3'b101); // Check for voice pitch mode
            O_en[3] <= (I_inst[7:6] == 2'b11); // Check for instrument mode
        
            O_octsel <= I_inst[5:3];
            O_notesel <= I_inst[2:0];
            O_filten <= I_inst[4];
            O_delta <= I_inst[3:0];
        end
    end
    
endmodule
