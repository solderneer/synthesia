`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2018 14:14:43
// Design Name: 
// Module Name: clk_gen
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


module clk_gen(
    input I_clk,
    input I_rst,
    output reg O_20KHz,
    output O_50MHz
    );

    reg [20:0] cnt;
    localparam clk_speed = 1250; 
    
    assign O_50MHz = ~cnt[0];
    
    initial begin
        cnt = 0;
        O_20KHz = 0;
    end
    
    always @(posedge(I_clk), posedge (I_rst)) begin
        if(I_rst) begin
            cnt <= 5'b0;
            O_20KHz <= 1'b0;
        end
        else if (cnt == (clk_speed - 1)) begin
            cnt <= 5'b0;
            O_20KHz <= ~O_20KHz;
        end
        else begin
            cnt <= cnt + 1;
            O_20KHz <= O_20KHz;
        end
            
    end

endmodule
