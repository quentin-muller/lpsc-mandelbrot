// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Tue May 31 11:22:28 2022
// Host        : Surface-2-Quent running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/lpsc-mandelbrot/ips/hw/lpsc_clk_mandelbrot/src/ip_core/clk_mandelbrot/clk_mandelbrot_stub.v
// Design      : clk_mandelbrot
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_mandelbrot(ClkMandelxCO, ClkMandel50, reset, PllLockedxSO, 
  ClkSys100MhzxCI)
/* synthesis syn_black_box black_box_pad_pin="ClkMandelxCO,ClkMandel50,reset,PllLockedxSO,ClkSys100MhzxCI" */;
  output ClkMandelxCO;
  output ClkMandel50;
  input reset;
  output PllLockedxSO;
  input ClkSys100MhzxCI;
endmodule
