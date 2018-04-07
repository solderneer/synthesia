
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
// C Model configuration for the "pitch_filter" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: 295,128,-414,-1363,-2275,-2554,-1903,-627,523,889,416,-331,-663,-348,241,524,267,-224,-445,-199,229,391,138,-243,-348,-79,261,309,23,-279,-271,31,293,230,-84,-302,-185,136,306,136,-186,-304,-84,233,293,27,-274,-273,34,309,243,-98,-337,-202,164,356,152,-230,-364,-91,295,361,21,-356,-344,58,412,313,-146,-460,-266,240,498,202,-340,-523,-119,444,533,18,-549,-523,105,655,491,-250,-759,-433,420,859,341,-621,-953,-207,861,1039,17,-1155,-1116,257,1535,1181,-668,-2072,-1233,1357,2967,1271,-2797,-5019,-1294,8313,18681,23147,18681,8313,-1294,-5019,-2797,1271,2967,1357,-1233,-2072,-668,1181,1535,257,-1116,-1155,17,1039,861,-207,-953,-621,341,859,420,-433,-759,-250,491,655,105,-523,-549,18,533,444,-119,-523,-340,202,498,240,-266,-460,-146,313,412,58,-344,-356,21,361,295,-91,-364,-230,152,356,164,-202,-337,-98,243,309,34,-273,-274,27,293,233,-84,-304,-186,136,306,136,-185,-302,-84,230,293,31,-271,-279,23,309,261,-79,-348,-243,138,391,229,-199,-445,-224,267,524,241,-348,-663,-331,416,889,523,-627,-1903,-2554,-2275,-1363,-414,128,295
// chanpats: 173
// name: pitch_filter
// filter_type: 0
// rate_change: 0
// interp_rate: 1
// decim_rate: 1
// zero_pack_factor: 1
// coeff_padding: 0
// num_coeffs: 227
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 0
// coeff_width: 16
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

const double pitch_filter_coefficients[227] = {295,128,-414,-1363,-2275,-2554,-1903,-627,523,889,416,-331,-663,-348,241,524,267,-224,-445,-199,229,391,138,-243,-348,-79,261,309,23,-279,-271,31,293,230,-84,-302,-185,136,306,136,-186,-304,-84,233,293,27,-274,-273,34,309,243,-98,-337,-202,164,356,152,-230,-364,-91,295,361,21,-356,-344,58,412,313,-146,-460,-266,240,498,202,-340,-523,-119,444,533,18,-549,-523,105,655,491,-250,-759,-433,420,859,341,-621,-953,-207,861,1039,17,-1155,-1116,257,1535,1181,-668,-2072,-1233,1357,2967,1271,-2797,-5019,-1294,8313,18681,23147,18681,8313,-1294,-5019,-2797,1271,2967,1357,-1233,-2072,-668,1181,1535,257,-1116,-1155,17,1039,861,-207,-953,-621,341,859,420,-433,-759,-250,491,655,105,-523,-549,18,533,444,-119,-523,-340,202,498,240,-266,-460,-146,313,412,58,-344,-356,21,361,295,-91,-364,-230,152,356,164,-202,-337,-98,243,309,34,-273,-274,27,293,233,-84,-304,-186,136,306,136,-185,-302,-84,230,293,31,-271,-279,23,309,261,-79,-348,-243,138,391,229,-199,-445,-224,267,524,241,-348,-663,-331,416,889,523,-627,-1903,-2554,-2275,-1363,-414,128,295};

const xip_fir_v7_2_pattern pitch_filter_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_pitch_filter_config() {
  xip_fir_v7_2_config config;
  config.name                = "pitch_filter";
  config.filter_type         = 0;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 1;
  config.zero_pack_factor    = 1;
  config.coeff               = &pitch_filter_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 227;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_INTEGER_COEFF;
  config.coeff_width         = 16;
  config.coeff_fract_width   = 0;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = pitch_filter_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 13;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_TRUNCATE_LSBS;
  config.output_width        = 12;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config pitch_filter_config = gen_pitch_filter_config();

