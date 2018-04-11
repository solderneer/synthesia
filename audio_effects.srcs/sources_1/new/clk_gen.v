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
    output O_clk1
);

    parameter CLK_DIV = 2500;
    reg [20:0] cnt; 

    assign O_clk1 = (cnt < CLK_DIV/2) ? 1'b0 : 1'b1;

    initial begin
        cnt = 0;
    end

    always @(posedge I_clk) begin
        cnt <= cnt + 20'd1;
        if(cnt >= (CLK_DIV-1)) begin
            cnt <= 20'd0;
        end
    end

endmodule
