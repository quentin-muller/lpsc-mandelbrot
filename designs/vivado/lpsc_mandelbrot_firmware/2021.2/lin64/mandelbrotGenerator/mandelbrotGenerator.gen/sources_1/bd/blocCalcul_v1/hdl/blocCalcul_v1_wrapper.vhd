--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
--Date        : Fri May 13 10:58:32 2022
--Host        : Surface-2-Quent running 64-bit major release  (build 9200)
--Command     : generate_target blocCalcul_v1_wrapper.bd
--Design      : blocCalcul_v1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blocCalcul_v1_wrapper is
  port (
    CLK_0 : in STD_LOGIC;
    c_imag : in STD_LOGIC_VECTOR ( 15 downto 0 );
    c_real : in STD_LOGIC_VECTOR ( 15 downto 0 );
    nextZ_imag : out STD_LOGIC_VECTOR ( 31 downto 0 );
    nextZ_real : out STD_LOGIC_VECTOR ( 31 downto 0 );
    z_imag : in STD_LOGIC_VECTOR ( 15 downto 0 );
    z_real : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end blocCalcul_v1_wrapper;

architecture STRUCTURE of blocCalcul_v1_wrapper is
  component blocCalcul_v1 is
  port (
    CLK_0 : in STD_LOGIC;
    nextZ_real : out STD_LOGIC_VECTOR ( 31 downto 0 );
    nextZ_imag : out STD_LOGIC_VECTOR ( 31 downto 0 );
    c_imag : in STD_LOGIC_VECTOR ( 15 downto 0 );
    c_real : in STD_LOGIC_VECTOR ( 15 downto 0 );
    z_real : in STD_LOGIC_VECTOR ( 15 downto 0 );
    z_imag : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component blocCalcul_v1;
begin
blocCalcul_v1_i: component blocCalcul_v1
     port map (
      CLK_0 => CLK_0,
      c_imag(15 downto 0) => c_imag(15 downto 0),
      c_real(15 downto 0) => c_real(15 downto 0),
      nextZ_imag(31 downto 0) => nextZ_imag(31 downto 0),
      nextZ_real(31 downto 0) => nextZ_real(31 downto 0),
      z_imag(15 downto 0) => z_imag(15 downto 0),
      z_real(15 downto 0) => z_real(15 downto 0)
    );
end STRUCTURE;
