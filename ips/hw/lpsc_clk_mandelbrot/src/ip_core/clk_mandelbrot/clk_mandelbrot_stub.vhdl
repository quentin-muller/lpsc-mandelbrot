-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Tue May 31 11:22:28 2022
-- Host        : Surface-2-Quent running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/lpsc-mandelbrot/ips/hw/lpsc_clk_mandelbrot/src/ip_core/clk_mandelbrot/clk_mandelbrot_stub.vhdl
-- Design      : clk_mandelbrot
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_mandelbrot is
  Port ( 
    ClkMandelxCO : out STD_LOGIC;
    ClkMandel50 : out STD_LOGIC;
    reset : in STD_LOGIC;
    PllLockedxSO : out STD_LOGIC;
    ClkSys100MhzxCI : in STD_LOGIC
  );

end clk_mandelbrot;

architecture stub of clk_mandelbrot is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ClkMandelxCO,ClkMandel50,reset,PllLockedxSO,ClkSys100MhzxCI";
begin
end;
