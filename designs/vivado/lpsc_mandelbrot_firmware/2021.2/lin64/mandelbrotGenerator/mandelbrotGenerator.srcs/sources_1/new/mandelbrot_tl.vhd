----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2022 17:49:12
-- Design Name: 
-- Module Name: mandelbrot_tl - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mandelbrot_tl is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           z_real : in STD_LOGIC_VECTOR (16 downto 0);
           z_imag : in STD_LOGIC_VECTOR (16 downto 0);
           c_real : in STD_LOGIC_VECTOR (16 downto 0);
           c_imag : in STD_LOGIC_VECTOR (16 downto 0);
           iteration : out STD_LOGIC_VECTOR (16 downto 0));
end mandelbrot_tl;

architecture Behavioral of mandelbrot_tl is

--constants

--composants
component mandelbrot_generator is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           z_real : in STD_LOGIC_VECTOR (16 downto 0);
           z_imag : in STD_LOGIC_VECTOR (16 downto 0);
           c_real : in STD_LOGIC_VECTOR (16 downto 0);
           c_imag : in STD_LOGIC_VECTOR (16 downto 0);
           nextZ_real : out STD_LOGIC_VECTOR (16 downto 0);
           nextZ_imag : out STD_LOGIC_VECTOR (16 downto 0));
end component mandelbrot_generator;

--signals
signal nextZ_real_s : STD_LOGIC_VECTOR (16 downto 0);
signal nextZ_imag_s : STD_LOGIC_VECTOR (16 downto 0);
signal Z_real_s : STD_LOGIC_VECTOR (16 downto 0);    -- affectation dans la machine d'état entre next et z
signal Z_imag_s : STD_LOGIC_VECTOR (16 downto 0);

begin

i_mandelbrot : entity work.mandelbrot_generator
    port map( clk        => clk,
              rst        => rst,
              z_real     => Z_real_s,
              z_imag     => Z_imag_s,
              c_real     => c_real,
              c_imag     => c_imag,
              nextZ_real => nextZ_real_s,
              nextZ_imag => nextZ_imag_s);

end Behavioral;
