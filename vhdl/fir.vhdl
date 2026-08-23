library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fir is
    port (
        b     : in  std_logic_vector(15 downto 0);
        y : out std_logic_vector(15 - 1 downto 0)
    );
end fir;

architecture behavior of fir is

begin

end behavior;