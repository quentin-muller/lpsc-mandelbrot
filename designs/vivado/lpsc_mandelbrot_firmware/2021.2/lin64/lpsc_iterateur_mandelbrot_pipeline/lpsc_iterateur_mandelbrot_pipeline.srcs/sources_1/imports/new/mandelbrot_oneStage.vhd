----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2022 15:12:54
-- Design Name: 
-- Module Name: mandelbrot_oneStage - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library ieee_perso;
use ieee_perso.fixed_pkg.all;

entity mandelbrot_oneStage is
    generic (
           SIZE_VEC : integer := 18
            );
    Port ( clk    : in std_logic;
           rst    : in std_logic;
           z_real : in sfixed(3 downto -14);
           z_imag : in sfixed(3 downto -14);
           c_real : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           c_imag : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           nextZ_real : out sfixed(3 downto -14);
           nextZ_imag : out sfixed(3 downto -14);
           div        : out STD_LOGIC;
           nbIter_out : out STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           nbIter_in  : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           ready_out  : out STD_LOGIC;
           ready_in   : in STD_LOGIC
          );
end mandelbrot_oneStage;

architecture Behavioral of mandelbrot_oneStage is

-- forcer l'utilisation des DSP
attribute use_dsp : string;
attribute use_dsp of Behavioral : architecture is "yes";

--signaux
signal ref              : sfixed(3 downto -14); --valeur ref pour le troncage
signal z_r_in, z_i_in   : sfixed(3 downto -14); -- entr�e caster en fixedpoint
signal z_r_out, z_i_out : sfixed(3 downto -14); -- entr�e caster en fixedpoint
signal rayonCarre_1,rayonCarre_2   : sfixed(3 downto -14); -- valeur de sortie du ryon au carr� en fixedpoint

signal c_r_in, c_i_in   : sfixed(3 downto -14); -- entr�e caster en fixedpoint
signal z2_r, z2_i       : sfixed(3 downto -14); -- signaux au carr�

signal z_re1_int             : sfixed(3 downto -14); --valeur intermediaire r�elle
signal z_im1_int1,z_im1_int2 : sfixed(3 downto -14); --valeur intermediaire imaginaire

signal pipeC_real_1,pipeC_real_2 : sfixed(3 downto -14); --signal de pipeline
signal pipeC_imag_1,pipeC_imag_2 : sfixed(3 downto -14); --signal de pipeline
signal pipe_nbIter_1,pipe_nbIter_2,pipe_nbIter_3 : std_logic_vector(SIZE_VEC-1 downto 0);
signal pipe_ready_1,pipe_ready_2,pipe_ready_3 : std_logic;

constant two    : sfixed(3 downto -14) := "001000000000000000"; -- valeur 2 pour un calcul en fixedpoint
constant QUATRE : sfixed(3 downto -14) := "010000000000000000"; -- valeur 4 pour la divergance

begin

--conversion des entr�e en fixed point
z_r_in <= z_real; 
z_i_in <= z_imag;
c_r_in <= to_sfixed(signed(c_real)); 
c_i_in <= to_sfixed(signed(c_imag));

-- routage des sorties
div <= '1' when (rayonCarre_2 >= QUATRE) else '0';
nextZ_real <= z_r_out;
nextZ_imag <= z_i_out;
nbIter_out <= pipe_nbIter_3;
ready_out  <= pipe_ready_3;

process(clk) is
begin
    if rst = '1' then
        pipe_nbIter_1 <= (others=>'0');
        pipe_nbIter_2 <= (others=>'0');
        pipe_nbIter_3 <= (others=>'0');
        pipe_ready_1  <= '1';
        pipe_ready_2  <= '1';
        pipe_ready_3  <= '1';
        
    elsif rising_edge(clk) then
        --1er �tage du pipeline
        z2_r         <= resize(arg=>z_r_in * z_r_in, size_res=>ref, round_style=>fixed_truncate);
        z2_i         <= resize(arg=>z_i_in * z_i_in, size_res=>ref, round_style=>fixed_truncate);
        z_im1_int1   <= resize(arg=>z_r_in * z_i_in, size_res=>ref, round_style=>fixed_truncate);
        pipeC_real_1 <= c_r_in;
        pipeC_imag_1 <= c_i_in;
        pipe_nbIter_1 <= nbIter_in;
        pipe_ready_1  <= ready_in;
        
        --2eme �tage du pipeline
        rayonCarre_1   <= resize(arg=>z2_r + z2_i, size_res=>ref, round_style=>fixed_truncate);
        z_re1_int      <= resize(arg=>z2_r - z2_i, size_res=>ref, round_style=>fixed_truncate);
        z_im1_int2     <= z_im1_int1(2 downto -14) & '0';
        pipeC_real_2   <= pipeC_real_1;
        pipeC_imag_2   <= pipeC_imag_1;
        pipe_nbIter_2  <= pipe_nbIter_1;
        pipe_ready_2   <= pipe_ready_1;
        
        --3eme �tage du pipeline
        z_r_out <= resize(arg=>z_re1_int+pipeC_real_2, size_res=>ref, round_style=>fixed_truncate);
        z_i_out <= resize(arg=>z_im1_int2 + pipeC_imag_2, size_res=>ref, round_style=>fixed_truncate);
        rayonCarre_2   <= rayonCarre_1;
        pipe_nbIter_3  <= pipe_nbIter_2;
        pipe_ready_3   <= pipe_ready_2;
    end if;
end process;

end Behavioral;
