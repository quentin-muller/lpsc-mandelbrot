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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mandelbrot_generator is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           z_real : in STD_LOGIC_VECTOR (16 downto 0);
           z_imag : in STD_LOGIC_VECTOR (16 downto 0);
           c_real : in STD_LOGIC_VECTOR (16 downto 0);
           c_imag : in STD_LOGIC_VECTOR (16 downto 0);
           nextZ_real : out STD_LOGIC_VECTOR (16 downto 0);
           nextZ_imag : out STD_LOGIC_VECTOR (16 downto 0));
end mandelbrot_generator;

architecture Behavioral of mandelbrot_generator is
--composants

--signaux
begin

--instanciation

end Behavioral;
