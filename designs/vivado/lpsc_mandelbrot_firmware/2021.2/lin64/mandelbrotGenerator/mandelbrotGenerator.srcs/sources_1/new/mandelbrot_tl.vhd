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
use IEEE.NUMERIC_STD.ALL;

library ieee_perso;
use ieee_perso.fixed_pkg.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mandelbrot_tl is
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
           
end mandelbrot_tl;

architecture Behavioral of mandelbrot_tl is

--constants

--composants
component  mandelbrot_generator is
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

-- definition du type de la machine d'état
type eState is (IDLE, WRITE_MEM, ITERATION_STEP);

--signals
signal nextZ_real_s : sfixed(3 downto -14);
signal nextZ_imag_s : sfixed(3 downto -14);
signal z_real_s     : sfixed(3 downto -14);    -- affectation dans la machine d'état entre next et z
signal z_imag_s     : sfixed(3 downto -14);
signal r2           : STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
signal divergence   : STD_LOGIC;
signal iter_s       : natural range 0 to MAX_ITER;

signal current_state, next_state : eState;


begin

i_mandelbrot : entity work.mandelbrot_generator
    generic map (
           SIZE_VEC => SIZE_VEC
    )
    port map( z_real     => z_real_s,
              z_imag     => z_imag_s,
              c_real     => c_real,
              c_imag     => c_imag,
              nextZ_real => nextZ_real_s,
              nextZ_imag => nextZ_imag_s,
              div        => divergence
              );
   
     process(rst, clk) is
     begin
        if rst = '1' then
            next_state <= IDLE;       
        elsif rising_edge(clk) then     
            CASE current_state IS
                WHEN IDLE =>
                    next_state <= ITERATION_STEP;
                    z_real_s <= (others => '0');
                    z_imag_s <= (others => '0');
                    iter_s <= 0;
                    ready <= '0';
                    we <= '0';
                    
                WHEN ITERATION_STEP =>
                    if ((divergence = '0') or (iter_s < MAX_ITER)) then
                        next_state <= ITERATION_STEP;
                        iter_s <= iter_s + 1;
                        z_real_s <= nextZ_real_s;
                        z_imag_s <= nextZ_imag_s;
                        ready <= '0';
                        we <= '0';
                    else
                        next_state <= WRITE_MEM;
                        ready <= '0';
                        we <= '1';
                        iteration <= std_logic_vector(to_unsigned(iter_s, iteration'length));
                        
                    end if;
                WHEN WRITE_MEM =>
                    next_state <= ITERATION_STEP;
                    z_real_s <= (others => '0');
                    z_imag_s <= (others => '0');
                    iter_s <= 0;    
                    ready <= '1';
                    we <= '0';
                WHEN OTHERS =>
                    next_state <= IDLE;
                END CASE;
        end if;
     end process;

process(rst, clk) is
begin
    if rising_edge(clk) then
        current_state <= next_state;
    end if;
end process;
end Behavioral;
