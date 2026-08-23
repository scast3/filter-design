library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fir is
    port (
        clk : in std_logic;
        rst : in std_logic;
        h  : in  std_logic_vector(15 downto 0); -- vector with taps
        x_in  : in  std_logic_vector(15 downto 0); -- signal
        y_out : out std_logic_vector(15 downto 0) -- output
    );
end fir;

architecture behavior of fir is

begin

end behavior;