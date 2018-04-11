
//------------------------------------------------------------------------------
// (c) Copyright 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "fir_filter" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: -838,-2171,-3594,-3994,-2500,713,4215,6127,5461,2934,477,-243,895,2493,2937,1817,190,-504,189,1382,1786,987,-205,-631,33,995,1208,451,-477,-630,93,871,856,70,-641,-531,250,832,578,-231,-716,-358,439,792,311,-477,-709,-132,614,704,32,-663,-614,129,745,546,-255,-774,-430,405,806,317,-531,-795,-170,661,773,24,-765,-713,141,857,628,-311,-924,-516,479,958,371,-652,-971,-209,809,944,20,-954,-884,184,1079,789,-396,-1170,-650,619,1230,474,-842,-1253,-266,1054,1229,22,-1255,-1163,244,1427,1045,-529,-1561,-866,836,1658,634,-1153,-1713,-360,1457,1701,29,-1749,-1622,353,2021,1474,-775,-2256,-1249,1230,2438,934,-1718,-2560,-529,2226,2605,29,-2745,-2557,577,3268,2399,-1292,-3778,-2104,2140,4273,1647,-3135,-4737,-980,4326,5163,32,-5787,-5540,1331,7678,5860,-3386,-10359,-6118,6825,14823,6305,-14022,-25081,-6420,41594,93381,115684,93381,41594,-6420,-25081,-14022,6305,14823,6825,-6118,-10359,-3386,5860,7678,1331,-5540,-5787,32,5163,4326,-980,-4737,-3135,1647,4273,2140,-2104,-3778,-1292,2399,3268,577,-2557,-2745,29,2605,2226,-529,-2560,-1718,934,2438,1230,-1249,-2256,-775,1474,2021,353,-1622,-1749,29,1701,1457,-360,-1713,-1153,634,1658,836,-866,-1561,-529,1045,1427,244,-1163,-1255,22,1229,1054,-266,-1253,-842,474,1230,619,-650,-1170,-396,789,1079,184,-884,-954,20,944,809,-209,-971,-652,371,958,479,-516,-924,-311,628,857,141,-713,-765,24,773,661,-170,-795,-531,317,806,405,-430,-774,-255,546,745,129,-614,-663,32,704,614,-132,-709,-477,311,792,439,-358,-716,-231,578,832,250,-531,-641,70,856,871,93,-630,-477,451,1208,995,33,-631,-205,987,1786,1382,189,-504,190,1817,2937,2493,895,-243,477,2934,5461,6127,4215,713,-2500,-3994,-3594,-2171,-838
// chanpats: 173
// name: fir_filter
// filter_type: 0
// rate_change: 0
// interp_rate: 1
// decim_rate: 1
// zero_pack_factor: 1
// coeff_padding: 0
// num_coeffs: 339
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 0
// coeff_width: 18
// coeff_fract_width: 0
// chan_seq: 0
// num_channels: 1
// num_paths: 1
// data_width: 13
// data_fract_width: 0
// output_rounding_mode: 1
// output_width: 12
// output_fract_width: 0
// config_method: 0

const double fir_filter_coefficients[339] = {-838,-2171,-3594,-3994,-2500,713,4215,6127,5461,2934,477,-243,895,2493,2937,1817,190,-504,189,1382,1786,987,-205,-631,33,995,1208,451,-477,-630,93,871,856,70,-641,-531,250,832,578,-231,-716,-358,439,792,311,-477,-709,-132,614,704,32,-663,-614,129,745,546,-255,-774,-430,405,806,317,-531,-795,-170,661,773,24,-765,-713,141,857,628,-311,-924,-516,479,958,371,-652,-971,-209,809,944,20,-954,-884,184,1079,789,-396,-1170,-650,619,1230,474,-842,-1253,-266,1054,1229,22,-1255,-1163,244,1427,1045,-529,-1561,-866,836,1658,634,-1153,-1713,-360,1457,1701,29,-1749,-1622,353,2021,1474,-775,-2256,-1249,1230,2438,934,-1718,-2560,-529,2226,2605,29,-2745,-2557,577,3268,2399,-1292,-3778,-2104,2140,4273,1647,-3135,-4737,-980,4326,5163,32,-5787,-5540,1331,7678,5860,-3386,-10359,-6118,6825,14823,6305,-14022,-25081,-6420,41594,93381,115684,93381,41594,-6420,-25081,-14022,6305,14823,6825,-6118,-10359,-3386,5860,7678,1331,-5540,-5787,32,5163,4326,-980,-4737,-3135,1647,4273,2140,-2104,-3778,-1292,2399,3268,577,-2557,-2745,29,2605,2226,-529,-2560,-1718,934,2438,1230,-1249,-2256,-775,1474,2021,353,-1622,-1749,29,1701,1457,-360,-1713,-1153,634,1658,836,-866,-1561,-529,1045,1427,244,-1163,-1255,22,1229,1054,-266,-1253,-842,474,1230,619,-650,-1170,-396,789,1079,184,-884,-954,20,944,809,-209,-971,-652,371,958,479,-516,-924,-311,628,857,141,-713,-765,24,773,661,-170,-795,-531,317,806,405,-430,-774,-255,546,745,129,-614,-663,32,704,614,-132,-709,-477,311,792,439,-358,-716,-231,578,832,250,-531,-641,70,856,871,93,-630,-477,451,1208,995,33,-631,-205,987,1786,1382,189,-504,190,1817,2937,2493,895,-243,477,2934,5461,6127,4215,713,-2500,-3994,-3594,-2171,-838};

const xip_fir_v7_2_pattern fir_filter_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_fir_filter_config() {
  xip_fir_v7_2_config config;
  config.name                = "fir_filter";
  config.filter_type         = 0;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 1;
  config.zero_pack_factor    = 1;
  config.coeff               = &fir_filter_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 339;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_INTEGER_COEFF;
  config.coeff_width         = 18;
  config.coeff_fract_width   = 0;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = fir_filter_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 13;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_TRUNCATE_LSBS;
  config.output_width        = 12;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config fir_filter_config = gen_fir_filter_config();

