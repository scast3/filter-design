library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fir is
    generic (NUM_TAPS : integer := 16);
    port (
        clk : in std_logic;
        rst : in std_logic;
        x_n  : in  signed(15 downto 0); -- input sample
        y_n : out signed(15 downto 0) -- output sample
    );
end fir;

architecture behavior of fir is

begin

end behavior;