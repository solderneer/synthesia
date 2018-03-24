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
    output reg O_clk1,
    output O_50MHz
    );

    reg [20:0] cnt;
    parameter CLK_DIV = 1250; 
    
    assign O_50MHz = ~cnt[0];

    initial begin
        cnt = 0;
        O_clk1 = 0;
    end

    always @(posedge(I_clk), posedge (I_rst)) begin
        if(I_rst) begin
            cnt <= 20'd0;
            O_clk1 <= 1'b0;
        end
        else if (cnt == (CLK_DIV - 1)) begin
            cnt <= 20'd0;
            O_clk1 <= ~O_clk1;
        end
        else begin
            cnt <= cnt + 1;
            O_clk1 <= O_clk1;
        end
    end

endmodule
