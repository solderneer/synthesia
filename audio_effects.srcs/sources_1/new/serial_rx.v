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

module serial_rx (
    input I_clk,
    input I_data,
    output reg O_datard,
    output reg [7:0] O_data
    );

    // wire baud_div;
    wire baud_clk;
    wire dummy1, dummy2;
    
    reg [3:0] state = 0;
    reg [1:0] data_sync = 2'b11;
    reg [1:0] data_cnt = 2'b11;
    reg filter_data = 1'b1;
    
    parameter BAUD_RATE = 115200;
    parameter CLK_RATE = 50000000;
    
    // clk dividers
    //clk_gen #(.CLK_DIV(217)) baudgen (I_clk, clk_reset, baud_div, dummy1); // Leave last one unattached
    // clk_gen #(.CLK_DIV(54)) baud8gen  (I_clk, baud_clk); // Leave last one unattached
    BaudTickGen #(50000000, 115200, 8) tickgen(.clk(I_clk), .enable(1'b1), .tick(baud_clk));
    
    initial begin
        O_data = 0;
        O_datard = 0;
    end
    
    // clk synchronizer using D flip flops
    always @(posedge I_clk) begin
        if(baud_clk) begin
            data_sync <= {data_sync[0], I_data};
        end
    end
    
    // filter on input stream
    always @(posedge I_clk) begin
        if(baud_clk) begin
            if((data_sync[1] == 1'b1) && (data_cnt != 2'b11)) begin
                data_cnt <= data_cnt + 1;
            end
            else if((data_sync[1] == 1'b0) && (data_cnt != 2'b00)) begin
                data_cnt <= data_cnt - 1;
            end
            
            if(data_cnt == 2'b11) begin
                filter_data <= 1'b1;
            end
            else if(data_cnt == 2'b00) begin
                filter_data <= 1'b0;
            end
        end
    end
    
    reg [2:0] OversamplingCnt = 0;
    always @(posedge I_clk) begin
        if(baud_clk) begin
            OversamplingCnt <= (state==0) ? 1'd0 : OversamplingCnt + 1'd1;
        end
    end
    wire sampleNow = baud_clk && (OversamplingCnt==3);
    
    // state machine
    always @(posedge I_clk) begin
        case(state)
            (4'b0000) : 
            begin
                if(~filter_data) begin
                    state <= 4'b0001;
                end
            end
            (4'b0001) : state <= (sampleNow) ? (4'b1000) : state;
            (4'b1000) : state <= (sampleNow) ? (4'b1001) : state;
            (4'b1001) : state <= (sampleNow) ? (4'b1010) : state;
            (4'b1010) : state <= (sampleNow) ? (4'b1011) : state;
            (4'b1011) : state <= (sampleNow) ? (4'b1100) : state;
            (4'b1100) : state <= (sampleNow) ? (4'b1101) : state;
            (4'b1101) : state <= (sampleNow) ? (4'b1110) : state;
            (4'b1110) : state <= (sampleNow) ? (4'b1111) : state;
            (4'b1111) : state <= (sampleNow) ? (4'b0010) : state;
            (4'b0010) : state <= (sampleNow) ? (4'b0000) : state;
            default: state <= 4'b0000;
        endcase
    end
    
    // set output data
    always @(posedge I_clk) begin
        if(sampleNow && state[3]) begin
            O_data <= {filter_data, O_data[7:1]};
        end
    end
    
    always @(posedge I_clk) begin
        O_datard <= (sampleNow && (state==4'b0010) && filter_data);  // make sure a stop bit is received
    end
endmodule

// Baud Tick generator obtained from fpga4fun.com
module BaudTickGen(
	input clk, enable,
	output tick  // generate a tick at the specified baud rate * oversampling
);
parameter ClkFrequency = 50000000;
parameter Baud = 115200;
parameter Oversampling = 1;

function integer log2(input integer v); begin log2=0; while(v>>log2) log2=log2+1; end endfunction
localparam AccWidth = log2(ClkFrequency/Baud)+8;  // +/- 2% max timing error over a byte
reg [AccWidth:0] Acc = 0;
localparam ShiftLimiter = log2(Baud*Oversampling >> (31-AccWidth));  // this makes sure Inc calculation doesn't overflow
localparam Inc = ((Baud*Oversampling << (AccWidth-ShiftLimiter))+(ClkFrequency>>(ShiftLimiter+1)))/(ClkFrequency>>ShiftLimiter);
always @(posedge clk) if(enable) Acc <= Acc[AccWidth-1:0] + Inc[AccWidth:0]; else Acc <= Inc[AccWidth:0];
assign tick = Acc[AccWidth];
endmodule