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
    input [7:0] sw_sel
    );

    //////////////////////////////////////////////////////////////////////////////////
    // Clock Divider Module: Generate necessary clocks from 100MHz FPGA CLK
    // Please create the clock divider module and instantiate it here.
      wire clk_20k;
      wire clk_50M;
      wire clk_reset;
      
      assign clk_reset = 0;
      
      clk_gen #(.CLK_DIV(1250)) clkgen (CLK, clk_reset, clk_20k, clk_50M);
  
     //////////////////////////////////////////////////////////////////////////////////
     //SPI Module: Converting serial data into a 12-bit parallel register
     //Do not change the codes in this area
       wire [11:0]MIC_in;
       SPI u1 (CLK, clk_20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, MIC_in);
   
    /////////////////////////////////////////////////////////////////////////////////////
    // Real-time Audio Effect Features
    // Please create modules to implement different features and instantiate them here   
      wire [11:0] speaker_out;
      wire [11:0] buf1_out;
      wire [11:0] buf2_out;
      wire [11:0] filt_out;
      wire [11:0] sigen_out;
      
      wire sample_flag;
      
      reg filt_rst = 0;
      reg [3:0] delta_sel = 4'b1100;
      
      sin_signal_gen sg1 (clk_20k, octave_sw, sw_sel, speaker_out); 
      
      // delay_buffer #(.SIZE(32768),.WR_OFFSET(12768)) buf1 (clk_20k, MIC_in, buf1_out);
      // pitch_shift buf2 (clk_20k, sigen_out, delta_sel, speaker_out);
      // flag_gen sample_flg (clk_50M, clk_20k, sample_flag);
      // butter_filter filt1 (clk_50M, buf2_out, sample_flag, filt_rst, filt_out); 
          
      // assign speaker_out = (SW1) ? filt_out : buf2_out;
    /////////////////////////////////////////////////////////////////////////////////////
    //DAC Module: Digital-to-Analog Conversion
    //Do not change the codes in this area        
      DA2RefComp u2(clk_50M, clk_20k, speaker_out, ,1'b0, J_DA2_Pin2, J_DA2_Pin3, J_DA2_Pin4, J_DA2_Pin1,);
        
  //////////////////////////////////////////////////////////////////////////////////

endmodule
