`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AY1718 Sem 1 EE2020 Project
// Project Name: Audio Effects
// Module Name: AUDIO_FX_TOP
// Team No.: 
// Student Names: 
// Matric No.:
// Description: 
// 
// Work Distribution:
//////////////////////////////////////////////////////////////////////////////////

module AUDIO_FX_TOP(
    input CLK,            // 100MHz FPGA clock
    
    input  J_MIC3_Pin3,   // PmodMIC3 audio input data (serial)
    output J_MIC3_Pin1,   // PmodMIC3 chip select, 20kHz sampling clock
    output J_MIC3_Pin4,   // PmodMIC3 serial clock (generated by module SPI.v)
     
    output J_DA2_Pin1,    // PmodDA2 sampling clock (generated by module DA2RefComp.vhd)
    output J_DA2_Pin2,    // PmodDA2 Data_A, 12-bit speaker output (generated by module DA2RefComp.vhd)
    output J_DA2_Pin3,    // PmodDA2 Data_B, not used (generated by module DA2RefComp.vhd)
    output J_DA2_Pin4,    // PmodDA2 serial clock, 50MHz clock
    
    // Student defined
    input octave_sw,
    input [7:0] sw_sel,
    input RsRx,
    output [7:0] led
    );

    //////////////////////////////////////////////////////////////////////////////////
    // Clock Divider Module: Generate necessary clocks from 100MHz FPGA CLK
    // Please create the clock divider module and instantiate it here.
      wire clk_20k;
      wire clk_50M;
      
      clk_gen #(.CLK_DIV(2500)) clkgen1 (clk_50M, clk_20k);
      clk_gen #(.CLK_DIV(2)) clkgen2 (CLK, clk_50M);
  
     //////////////////////////////////////////////////////////////////////////////////
     //SPI Module: Converting serial data into a 12-bit parallel register
     //Do not change the codes in this area
       wire [11:0] MIC_in;
       SPI u1 (CLK, clk_20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, MIC_in);
   
    /////////////////////////////////////////////////////////////////////////////////////
    // Real-time Audio Effect Features
    // Please create modules to implement different features and instantiate them here   
      wire [11:0] pitch_out;
      wire [11:0] delay_out;
      wire [11:0] inst_out;
      
      wire [3:0] delta;
      wire [2:0] oct_sel;
      wire [2:0] note_sel;
      wire filt_en;
      wire serial_rdy;

      wire [7:0] serial_in;
      wire [3:0] enable;
      reg [11:0] speaker_out = 0;
      
      serial_rx rx1 (clk_50M, RsRx, serial_rdy, serial_in);
      inst_decoder (clk_50M, serial_in, serial_rdy, enable, oct_sel, note_sel, filt_en, delta);
      sin_signal_gen sg1 (clk_20k, oct_sel, note_sel, inst_out); 
      delay_buffer #(.SIZE(32768),.WR_OFFSET(20000)) buf1 (clk_20k, MIC_in, delay_out);
      pitch_shift buf2 (clk_50M, clk_20k, MIC_in, delta, filt_en, pitch_out);
      
      assign led = (serial_rdy) ? (serial_in) : led;
      
      always @(posedge clk_50M) begin
        case(enable)
            (4'b0000) : speaker_out <= 0;
            (4'b0001) : speaker_out <= MIC_in;
            (4'b0010) : speaker_out <= delay_out;
            (4'b0100) : speaker_out <= pitch_out;
            (4'b1000) : speaker_out <= inst_out;
            default : speaker_out <= 0;
        endcase
      end
    
    /////////////////////////////////////////////////////////////////////////////////////
    //DAC Module: Digital-to-Analog Conversion
    //Do not change the codes in this area        
      DA2RefComp u2(clk_50M, clk_20k, speaker_out, ,1'b0, J_DA2_Pin2, J_DA2_Pin3, J_DA2_Pin4, J_DA2_Pin1,);
        
  //////////////////////////////////////////////////////////////////////////////////

endmodule