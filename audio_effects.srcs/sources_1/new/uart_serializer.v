`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2018 20:12:07
// Design Name: 
// Module Name: uart_serializer
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


module uart_serializer(

    );
endmodule

module serial_tx (
    input I_clk,
    input I_baudclk,
    input [7:0] I_data,
    input I_start,
    output reg O_busy,
    output O_data
    );

    reg [3:0] state;
    reg out_bit; 
    
    assign O_data = (state < 4) | (state[3] & out_bit);
    
    initial begin
        state = 0;
        out_bit = 0;
    end
    
    always @(posedge I_clk) begin
        case(state)
            (4'b0000):
            begin
                if(I_start) begin
                    state <= 4'b0100;
                    O_busy <= 1;
                end
            end
            (4'b0100): state <= (I_baudclk) ? 4'b1000 : state;
            (4'b1000): state <= (I_baudclk) ? 4'b1001 : state;
            (4'b1001): state <= (I_baudclk) ? 4'b1010 : state;
            (4'b1010): state <= (I_baudclk) ? 4'b1011 : state;
            (4'b1011): state <= (I_baudclk) ? 4'b1100 : state;
            (4'b1100): state <= (I_baudclk) ? 4'b1101 : state;
            (4'b1101): state <= (I_baudclk) ? 4'b1110 : state;
            (4'b1110): state <= (I_baudclk) ? 4'b1111 : state;
            (4'b1111): state <= (I_baudclk) ? 4'b0001 : state;
            (4'b0001): state <= (I_baudclk) ? 4'b0010 : state;
            (4'b0010): state <= (I_baudclk) ? 4'b0000 : state;
            default: state <= 4'b0000;
        endcase
    end
    
    always @(state[2:0]) begin
        out_bit <= I_data[state];
        O_busy <= 0;
    end
    
endmodule

module serial_rx (
    input I_clk,
    input I_baudclk,
    input I_data,
    output reg [7:0] O_data,
    output reg O_datard
    );

    wire baud_div;
    
    reg [3:0] clk_cnt = 0;
    reg [3:0] state = 0;
    reg [1:0] data_sync = 0;
    reg [1:0] data_cnt = 0;
    reg start_bit = 0;
    
    assign baud_div = (clk_cnt == 15);
    
    // Clk divider for baud rate
    always @(I_clk) begin
        if(state == 0) begin
            clk_cnt <= 0;
        end
        else if(baud_div) begin
            clk_cnt <= clk_cnt + 1;
        end
    end
    
    // Clk synchronizer using D flip flops
    always @(posedge I_clk) begin
        if(I_baudclk) begin
            data_sync[1:0] <= {data_sync[0], I_data};
        end
    end
    
    // Filter on input stream
    always @(posedge I_clk) begin
        if(I_baudclk) begin
            if(data_sync[1] && (data_cnt != 2'b11)) begin
                data_cnt <= data_cnt + 1;
            end
            if(!data_sync[1] && (data_cnt != 2'b00)) begin
                data_cnt <= data_cnt - 1;
            end
            if(data_cnt == 2'b11) begin
                start_bit <= 1;
            end
            if(data_cnt == 2'b00) begin
                start_bit <= 1;
            end
        end
    end
    
    // State machine
    always @(posedge I_clk) begin
        case(state)
            (4'b0000) : 
            begin
                if(~start_bit) begin
                    state <= 4'b1000;
                end     
                O_datard <= 0;
            end
            (4'b1000) : state <= (baud_div) ? (4'b1001) : state;
            (4'b1001) : state <= (baud_div) ? (4'b1010) : state;
            (4'b1010) : state <= (baud_div) ? (4'b1011) : state;
            (4'b1011) : state <= (baud_div) ? (4'b1100) : state;
            (4'b1100) : state <= (baud_div) ? (4'b1101) : state;
            (4'b1101) : state <= (baud_div) ? (4'b1110) : state;
            (4'b1110) : state <= (baud_div) ? (4'b1111) : state;
            (4'b1111) : state <= (baud_div) ? (4'b0001) : state;
            (4'b0001) : state <= (baud_div) ? (4'b0000) : state;
            default: state <= 4'b0000;
        endcase
    end
    
    // Set output data
    always @(posedge I_clk) begin
        if(I_baudclk && baud_div && state[3]) begin
            O_data = {I_data, O_data[7:1]};
            O_datard <= 1;
        end
    end
    
    
endmodule