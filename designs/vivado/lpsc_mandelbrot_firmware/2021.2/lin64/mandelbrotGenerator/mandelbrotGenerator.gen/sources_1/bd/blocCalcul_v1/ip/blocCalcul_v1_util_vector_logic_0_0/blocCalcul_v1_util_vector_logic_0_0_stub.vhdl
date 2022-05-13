-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Fri May 13 11:01:42 2022
-- Host        : Surface-2-Quent running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/lpsc-mandelbrot/designs/vivado/lpsc_mandelbrot_firmware/2021.2/lin64/mandelbrotGenerator/mandelbrotGenerator.gen/sources_1/bd/blocCalcul_v1/ip/blocCalcul_v1_util_vector_logic_0_0/blocCalcul_v1_util_vector_logic_0_0_stub.vhdl
-- Design      : blocCalcul_v1_util_vector_logic_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blocCalcul_v1_util_vector_logic_0_0 is
  Port ( 
    Op1 : in STD_LOGIC_VECTOR ( 30 downto 0 );
    Res : out STD_LOGIC_VECTOR ( 30 downto 0 )
  );

end blocCalcul_v1_util_vector_logic_0_0;

architecture stub of blocCalcul_v1_util_vector_logic_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Op1[30:0],Res[30:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2021.2";
begin
end;
