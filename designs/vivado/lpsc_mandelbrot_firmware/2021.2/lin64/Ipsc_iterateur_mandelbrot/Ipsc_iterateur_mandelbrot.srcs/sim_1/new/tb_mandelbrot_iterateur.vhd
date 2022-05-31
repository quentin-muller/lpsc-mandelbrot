----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2022 13:17:45
-- Design Name: 
-- Module Name: tb_mandelbrot_iterateur - Behavioral
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


entity tb_mandelbrot_iterateur is
--  Port ( );
end tb_mandelbrot_iterateur;

architecture Behavioral of tb_mandelbrot_iterateur is
--componenent
component mandelbrot_stateMachine is
    generic (
           SIZE_VEC  : integer := 18;
           MAX_ITER  : integer := 100
            );
    Port ( clk       : in STD_LOGIC;
           rst       : in STD_LOGIC;
           z_real    : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           z_imag    : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           c_real    : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           c_imag    : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           iteration : out STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           ready     : out STD_LOGIC;
           we        : out STD_LOGIC
           );
end component;

--constantes
constant SIZE_VEC : integer := 18;
constant CLK_PERIOD: time := 20ns;

-- signaux
signal clk : std_logic := '0';
signal rst : std_logic := '0';


signal z_real_sti    : STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
signal z_imag_sti    : STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
signal c_real_sti    : STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
signal c_imag_sti    : STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
signal iteration_obs : STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
signal ready_obs     : STD_LOGIC;
signal we_obs        : STD_LOGIC;

begin

clk <= not clk after (CLK_PERIOD / 2);

tl_mandelbrot: entity work.mandelbrot_stateMachine
    Port map( 
           clk       => clk,
           rst       => rst,
           z_real    => z_real_sti,
           z_imag    => z_imag_sti,
           c_real    => c_real_sti,
           c_imag    => c_imag_sti,
           iteration => iteration_obs,
           ready     => ready_obs,
           we        => we_obs
           );


p1 : process is
begin
    rst <= '1';
    wait for 10ns;
    rst <= '0';
-- -2 + 0j      
    c_real_sti <= "111000000000000000";
    c_imag_sti <= "000000000000000000";
    z_real_sti <= "000000000000000000";
    z_imag_sti <= "000000000000000000";
    wait until ready_obs = '1';
    
-- -1 + 0.5j
    c_real_sti <= "111100000000000000";
    c_imag_sti <= "000010000000000000";
    z_real_sti <= "000000000000000000";
    z_imag_sti <= "000000000000000000";
    wait until ready_obs = '1';
    
-- 0 + 0j  
    c_real_sti <= "000000000000000000";
    c_imag_sti <= "000000000000000000";
    z_real_sti <= "000000000000000000";
    z_imag_sti <= "000000000000000000";
    wait until ready_obs = '1';

    wait;
end process p1;
end Behavioral;
