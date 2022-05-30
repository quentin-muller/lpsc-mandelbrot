----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2022 17:49:12
-- Design Name: 
-- Module Name: mandelbrot_stateMachine - Behavioral
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

entity mandelbrot_stateMachine is
    generic (
           SIZE_VEC  : integer := 18;
           MAX_ITER  : integer := 100;
           SIZE_ITER : integer := 7
            );
    Port ( clk       : in STD_LOGIC;
           rst       : in STD_LOGIC;
           z_real    : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           z_imag    : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           c_real    : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           c_imag    : in STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
           iteration : out STD_LOGIC_VECTOR ((SIZE_ITER-1) downto 0);
           ready     : out STD_LOGIC;
           we        : out STD_LOGIC
           );
           
end mandelbrot_stateMachine;

architecture Behavioral of mandelbrot_stateMachine is

--constants

--composants
component  mandelbrot_oneStage is
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
signal iter_in,iter_out: natural range 0 to MAX_ITER;
signal iter_s_in,iter_s_out : STD_LOGIC_VECTOR (SIZE_VEC-1 downto 0);
signal ready_s_out,ready_s_in      : std_logic;

signal current_state, next_state : eState;


begin

i_mandelbrot : entity work.mandelbrot_oneStage
    generic map (
           SIZE_VEC => SIZE_VEC
    )
    port map( clk        => clk,
              rst        => rst,
              z_real     => z_real_s,
              z_imag     => z_imag_s,
              c_real     => c_real,
              c_imag     => c_imag,
              nextZ_real => nextZ_real_s,
              nextZ_imag => nextZ_imag_s,
              div        => divergence,
              nbIter_out =>iter_s_out,
              nbIter_in  =>iter_s_in,
              ready_out  =>ready_s_out,
              ready_in   =>ready_s_in
              );
   

iter_s_in  <= std_logic_vector(to_unsigned(iter_in, SIZE_VEC));
iter_out   <= to_integer(unsigned(iter_s_out));
process(rst, clk) is
begin
    if rising_edge(clk) then
        if ((divergence = '0') and (iter_out < MAX_ITER)) then
            z_real_s <= nextZ_real_s;
            z_imag_s <= nextZ_imag_s;
            ready_s_in <= '0';
            we <= '0';
            iter_in <= iter_out + 1;
        else 
            z_real_s <= (others => '0');
            z_imag_s <= (others => '0');
            ready_s_in <= '1';
            we <= '1';
            iteration <= std_logic_vector(to_unsigned(iter_out, iteration'length)); 
        end if;
    end if;
end process;

--routage des sorties
ready <= ready_s_out;

end Behavioral;
