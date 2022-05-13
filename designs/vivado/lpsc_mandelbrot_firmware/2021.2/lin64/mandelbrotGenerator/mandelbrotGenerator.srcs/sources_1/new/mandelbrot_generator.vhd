----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2022 17:45:52
-- Design Name: 
-- Module Name: mandelbrot_generator - Behavioral
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
-- Composatn interne du generateur d'image de mandelbrot
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library ieee_perso;
use ieee_perso.fixed_pkg.all;
--use ieee_perso.fixed_float_types.all;


entity mandelbrot_generator is
    generic (
           SIZE_VEC : integer := 18
            );
    Port ( clk    : in STD_LOGIC;
           rst    : in STD_LOGIC;
           z_real : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           z_imag : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           c_real : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           c_imag : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           nextZ_real : out STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           nextZ_imag : out STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           rayon_2    : out STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0)
          );
end mandelbrot_generator;

architecture Behavioral of mandelbrot_generator is
-- forcer l'utilisation des DSP
attribute use_dsp : string;
attribute use_dsp of Behavioral : architecture is "yes";

--composants

--signaux
signal ref              : sfixed(3 downto -14); --valeur ref pour le troncage
signal z_r_in, z_i_in   : sfixed(3 downto -14); -- entrée caster en fixedpoint
signal z_r_out, z_i_out : sfixed(3 downto -14); -- entrée caster en fixedpoint
signal rayonCarre_out   : sfixed(3 downto -14); -- valeur de sortie du ryon au carré en fixedpoint

signal c_r_in, c_i_in   : sfixed(3 downto -14); -- entrée caster en fixedpoint
signal z2_r, z2_i       : sfixed(3 downto -14); -- signaux au carré

signal z_re1_int             : sfixed(3 downto -14); --valeur intermediaire réelle
signal z_im1_int1,z_im1_int2 : sfixed(3 downto -14); --valeur intermediaire imaginaire

constant two : sfixed(3 downto -14) := "010000000000000000"; -- valeur 2 pour un calcul en fixedpoint

begin

--conversion des entrée en fixed point
z_r_in <= to_sfixed(signed(z_real)); 
z_i_in <= to_sfixed(signed(z_imag));
c_r_in <= to_sfixed(signed(c_real)); 
c_i_in <= to_sfixed(signed(c_imag));

-- Calcul du carré des valeurs d'entrées
z2_r <= resize(arg=>z_r_in * z_r_in, size_res=>ref, round_style=>fixed_truncate);
z2_i <= resize(arg=>z_i_in * z_i_in, size_res=>ref, round_style=>fixed_truncate);


-- calcul valeurs futures
z_re1_int <= resize(arg=>z2_r - z2_i, size_res=>ref, round_style=>fixed_truncate);
z_r_out   <= resize(arg=>z_re1_int+c_r_in, size_res=>ref, round_style=>fixed_truncate);


z_im1_int1 <= resize(arg=>two * z_r_in, size_res=>ref, round_style=>fixed_truncate);
z_im1_int2 <= resize(arg=>z_im1_int1 * z_i_in, size_res=>ref, round_style=>fixed_truncate);
z_i_out    <= resize(arg=>z_im1_int2 + c_i_in, size_res=>ref, round_style=>fixed_truncate);

-- calcul du rayon au carré
rayonCarre_out <= resize(arg=>z2_r + z2_i, size_res=>ref, round_style=>fixed_truncate);

-- routage des sorties
rayon_2    <= std_logic_vector(TO_SIGNED(rayonCarre_out, rayon_2'length));
nextZ_real <= std_logic_vector(TO_SIGNED(z_r_out, nextZ_real'length));
nextZ_imag <= std_logic_vector(TO_SIGNED(z_i_out, nextZ_imag'length));

--instanciation

end Behavioral;
