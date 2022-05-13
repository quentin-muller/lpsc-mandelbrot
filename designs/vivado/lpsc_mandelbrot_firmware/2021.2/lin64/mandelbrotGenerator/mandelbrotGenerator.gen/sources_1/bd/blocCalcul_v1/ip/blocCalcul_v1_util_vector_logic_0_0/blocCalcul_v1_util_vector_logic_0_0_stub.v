// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Fri May 13 11:01:42 2022
// Host        : Surface-2-Quent running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/lpsc-mandelbrot/designs/vivado/lpsc_mandelbrot_firmware/2021.2/lin64/mandelbrotGenerator/mandelbrotGenerator.gen/sources_1/bd/blocCalcul_v1/ip/blocCalcul_v1_util_vector_logic_0_0/blocCalcul_v1_util_vector_logic_0_0_stub.v
// Design      : blocCalcul_v1_util_vector_logic_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2021.2" *)
module blocCalcul_v1_util_vector_logic_0_0(Op1, Res)
/* synthesis syn_black_box black_box_pad_pin="Op1[30:0],Res[30:0]" */;
  input [30:0]Op1;
  output [30:0]Res;
endmodule
