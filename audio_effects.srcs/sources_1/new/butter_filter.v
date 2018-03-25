`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2018 15:39:19
// Design Name: 
// Module Name: butter_filter
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


module butter_filter(
    input I_clk,
    input [11:0] I_input,
    input I_flag,
    input I_rst,
    output [11:0] O_output
    );
    
    // a[n] coefficients
    reg signed [31:0] a1 = 32'hFFF81594;
    reg signed [31:0] a2 = 32'hFFF6D9DD;
    reg signed [31:0] a3 = 32'hFFFBBCE8;
    reg signed [31:0] a4 = 32'hFFFE4797;
    reg signed [31:0] a5 = 32'hFFFFAF65;
    reg signed [31:0] a6 = 32'hFFFFF7FB;
    
    // b[n] coefficients
    reg signed [31:0] b1 = 32'h80000;
    reg signed [31:0] b2 = 32'h300000;
    reg signed [31:0] b3 = 32'h780000;
    reg signed [31:0] b4 = 32'hA00000;    
    reg signed [31:0] b5 = 32'h780000;
    reg signed [31:0] b6 = 32'h300000;
    reg signed [31:0] b7 = 32'h80000;
    
    // filter state vars
    wire signed [31:0] f1_new, f1_coeff_x;
    reg signed [31:0] f1_coeff, f1_old, f1_val;
    reg [3:0] state;
    
    // input history : x_n is immediate input
    reg signed [31:0] x_n, x_n1, x_n2, x_n3, x_n4, x_n5, x_n6;
    
    // output history
    reg signed [31:0] y_n1, y_n2, y_n3, y_n4, y_n5, y_n6;
    wire signed [31:0] I_fxdpt;
    
    // Temporary value holder
    reg signed [31:0] temp_out;
    
    // Multiply Accumulate (MAC)
    signed_mult mult1 (f1_val, f1_coeff, f1_coeff_x);
    to_fixedpt (I_input, I_fxdpt);
    reverse_fixedpt (temp_out, O_output);
    
    assign f1_new = f1_old + f1_coeff_x;
    
    always @(posedge I_clk) begin
        if(I_rst) begin 
            state  <= 4'd15; //turn off the state machine
            f1_val <= 0;
            f1_coeff <= 0;
            f1_old <= 0;
            x_n <= 0;
            x_n1 <= 0;
            x_n2 <= 0;
            x_n3 <= 0;
            x_n4 <= 0;
            x_n5 <= 0;
            x_n6 <= 0;
            y_n1 <= 0;
            y_n2 <= 0;
            y_n3 <= 0;
            y_n4 <= 0;
            y_n5 <= 0;
            y_n6 <= 0;
        end
        else begin
            case(state)
                (1) :   
                begin
                    f1_old <= 32'b0;
                    f1_coeff <= b1;
                    f1_val <= I_fxdpt;
                    x_n <= I_fxdpt;
                    
                    state <= 4'd2;
                end
                (2) : 
                begin   
                    f1_old <= f1_new;
                    f1_coeff <= b2;
                    f1_val <= x_n1;
                    state <= 4'd3;
                end
                (3) :
                begin
                    f1_old <= f1_new;
                    f1_coeff <= b3;
                    f1_val <= x_n2;
                    state <= 4'd4;
                end
                (4) :
                begin
                    f1_old <= f1_new;
                    f1_coeff <= b4;
                    f1_val <= x_n3;
                    state <= 4'd5;
                end
                (5) : 
                begin
                    f1_old <= f1_new;
                    f1_coeff <= b5;
                    f1_val <= x_n4;
                    state <= 4'd6;
                end
                (6) :
                begin
                    f1_old <= f1_new;
                    f1_coeff <= b6;
                    f1_val <= x_n5;
                    state <= 4'd7;
                end
                (7) :
                begin
                    f1_old <= f1_new;
                    f1_coeff <= b7;
                    f1_val <= x_n6;
                    state <= 4'd8;
                end
                (8) : 
                begin
                    f1_old <= f1_new;
                    f1_coeff <= a1;
                    f1_val <= y_n1;
                    state <= 4'd9;
                end
                (9) :
                begin 
                    f1_old <= f1_new;
                    f1_coeff <= a2;
                    f1_val <= y_n2;
                    state <= 4'd10;
                end
                (10) :
                begin
                    f1_old <= f1_new;
                    f1_coeff <= a3;
                    f1_val <= y_n3;
                    state <= 4'd11;
                end
                (11) :
                begin
                    f1_old <= f1_new;
                    f1_coeff <= a4;
                    f1_val <= y_n4;
                    state <= 4'd12;
                end
                (12) :
                begin
                    f1_old <= f1_new;
                    f1_coeff <= a5;
                    f1_val <= y_n5;
                    state <= 4'd13;
                end
                (13) :
                begin
                    f1_old <= f1_new;
                    f1_coeff <= a6;
                    f1_val <= y_n6;
                    state <= 4'd14;
                end
                (14) :
                begin
                    y_n1 <= f1_new;
                    temp_out <= y_n1;
                    
                    // Updating output bank
                    y_n2 <= y_n1;
                    y_n3 <= y_n2;
                    y_n4 <= y_n3;
                    y_n5 <= y_n4;
                    y_n6 <= y_n5;
                    
                    // Updating input bank
                    x_n1 <= x_n;
                    x_n2 <= x_n1;
                    x_n3 <= x_n2;
                    x_n4 <= x_n3;
                    x_n5 <= x_n4;
                    x_n6 <= x_n5;
                    
                    state <= 4'd15;
                end
                (15) :
                begin
                    if (I_flag) begin
                        state = 4'd1;
                    end
                end
                default :
                begin
                    state = 4'd15;
                end
            endcase
        end
    end
endmodule

// Signed mult of Q13.19 format 2' complement
module signed_mult (
    input signed [31:0] a,
    input signed [31:0] b,
    output [31:0] out
    );
    
    wire signed [63:0] multi_out;
    
    assign multi_out = a * b; // Ouput is of format Q26.38
    assign out = {multi_out[63], multi_out[49:19]}; // Truncating output to Q13.19
endmodule

// Convert 12-bit unsigned into to Q13.19 format 2'complement (always positive)
module to_fixedpt (
    input [11:0] a,
    output [31:0] out
    );
    
    assign out = {{1'b0, a[11:0]}, 19'd0}; 
endmodule

// Convert Q13.19 format 2' complement to 12 bit unsigned
module reverse_fixedpt (
    input [31:0] a,
    output [11:0] out
    );

    assign out = a[30:19];
endmodule