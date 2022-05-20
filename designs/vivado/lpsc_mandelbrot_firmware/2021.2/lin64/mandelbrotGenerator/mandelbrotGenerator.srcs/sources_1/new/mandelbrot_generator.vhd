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
    Port ( z_real : in sfixed(3 downto -14);
           z_imag : in sfixed(3 downto -14);
           c_real : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           c_imag : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           nextZ_real : out sfixed(3 downto -14);
           nextZ_imag : out sfixed(3 downto -14);
           div        : out STD_LOGIC
          );
end mandelbrot_generator;

architecture Behavioral of mandelbrot_generator is
-- forcer l'utilisation des DSP
attribute use_dsp : string;
attribute use_dsp of Behavioral : architecture is "yes";

--composants

--signaux
signal ref              : sfixed(3 downto -14); --valeur ref pour le troncage
signal z_r_in, z_i_in   : sfixed(3 downto -14); -- entr�e caster en fixedpoint
signal z_r_out, z_i_out : sfixed(3 downto -14); -- entr�e caster en fixedpoint
signal rayonCarre_out   : sfixed(3 downto -14); -- valeur de sortie du ryon au carr� en fixedpoint
signal rayon_2          : std_logic_vector((SIZE_VEC-1) downto 0); -- 

signal c_r_in, c_i_in   : sfixed(3 downto -14); -- entr�e caster en fixedpoint
signal z2_r, z2_i       : sfixed(3 downto -14); -- signaux au carr�

signal z_re1_int             : sfixed(3 downto -14); --valeur intermediaire r�elle
signal z_im1_int1,z_im1_int2 : sfixed(3 downto -14); --valeur intermediaire imaginaire

constant two : sfixed(3 downto -14) := "001000000000000000"; -- valeur 2 pour un calcul en fixedpoint
constant QUATRE : std_logic_vector((SIZE_VEC-1) downto 0) := "000000000000000100";
begin

--conversion des entr�e en fixed point
z_r_in <= z_real; 
z_i_in <= z_imag;
c_r_in <= to_sfixed(signed(c_real)); 
c_i_in <= to_sfixed(signed(c_imag));

-- Calcul du carr� des valeurs d'entr�es
z2_r <= resize(arg=>z_r_in * z_r_in, size_res=>ref, round_style=>fixed_truncate);
z2_i <= resize(arg=>z_i_in * z_i_in, size_res=>ref, round_style=>fixed_truncate);


-- calcul valeurs futures
z_re1_int <= resize(arg=>z2_r - z2_i, size_res=>ref, round_style=>fixed_truncate);
z_r_out   <= resize(arg=>z_re1_int+c_r_in, size_res=>ref, round_style=>fixed_truncate);


z_im1_int1 <= resize(arg=>two * z_r_in, size_res=>ref, round_style=>fixed_truncate);
z_im1_int2 <= resize(arg=>z_im1_int1 * z_i_in, size_res=>ref, round_style=>fixed_truncate);
z_i_out    <= resize(arg=>z_im1_int2 + c_i_in, size_res=>ref, round_style=>fixed_truncate);

-- calcul du rayon au carr�
rayonCarre_out <= resize(arg=>z2_r + z2_i, size_res=>ref, round_style=>fixed_truncate);


rayon_2    <= std_logic_vector(TO_SIGNED(rayonCarre_out, rayon_2'length));

-- routage des sorties
div <= '1' when (rayon_2 >= QUATRE) else '0';

nextZ_real <= z_r_out;
nextZ_imag <= z_i_out;

--instanciation

end Behavioral;
