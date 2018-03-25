`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2018 20:02:50
// Design Name: 
// Module Name: lookup_sim
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


module lookup_sim(

    );
    
    reg [11:0] cnt;
    wire [11:0] out;
    
    sine_lut lut1 (cnt, out);
    
    initial begin
        cnt = 0;
    end
    
    always begin
        #5; cnt = cnt + 1;
    end
        
endmodule
