----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2022 15:19:55
-- Design Name: 
-- Module Name: tb_singleStage - Behavioral
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

entity tb_singleStage is
--  Port ( );
end tb_singleStage;

architecture Behavioral of tb_singleStage is

component  mandelbrot_oneStage is
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
end component;

constant SIZE_VEC : integer := 18;
constant CLK_PERIOD: time := 10ns;

signal nextZ_real_obs : sfixed(3 downto -14);
signal nextZ_imag_obs : sfixed(3 downto -14);
signal divergence   : STD_LOGIC;

-- signaux de simulation
signal c_real_sti : STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
signal c_imag_sti : STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
signal z_real_ref   : sfixed(3 downto -14) := (others =>'0');
signal z_imag_ref   : sfixed(3 downto -14) := (others =>'0');

signal clk : std_logic := '0';
signal rst : std_logic := '0';

begin

clk <= not clk after (CLK_PERIOD / 2);

i_mandelbrot : entity work.mandelbrot_oneStage
    generic map (
           SIZE_VEC => SIZE_VEC
    )
    port map( z_real     => z_real_ref,
              z_imag     => z_imag_ref,
              c_real     => c_real_sti,
              c_imag     => c_imag_sti,
              nextZ_real => nextZ_real_obs,
              nextZ_imag => nextZ_imag_obs,
              div        => divergence
              );

p1 : process is
begin
-- -1 + 0.5j
    --c_real_sti <= "111100000000000000";
    --c_imag_sti <= "000010000000000000";
-- -2 + 0j  
    c_real_sti <= "111000000000000000";
    c_imag_sti <= "000000000000000000";
    wait for 2*CLK_PERIOD ;

    z_real_ref <= nextZ_real_obs;
    z_imag_ref <= nextZ_imag_obs;
    wait for 2*CLK_PERIOD ;
    
    z_real_ref <= nextZ_real_obs;
    z_imag_ref <= nextZ_imag_obs;
    wait for 2*CLK_PERIOD ;
    
    wait;

end process p1;

end Behavioral;


