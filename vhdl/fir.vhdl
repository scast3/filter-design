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
    type coeff_array is array (0 to NUM_TAPS-1) of signed(15 downto 0); -- len 16 array of taps
    constant h : coeff_array := (
        0  => to_signed(-592, 16),   -- -0.018067 * 32768
        1  => to_signed(-910, 16),   -- -0.027764 * 32768
        2  => to_signed(-895, 16),   -- -0.027322 * 32768
        3  => to_signed(-23, 16),    -- -0.000716 * 32768
        4  => to_signed(1880, 16),   --  0.057379 * 32768
        5  => to_signed(4502, 16),   --  0.137394 * 32768
        6  => to_signed(7068, 16),   --  0.215702 * 32768
        7  => to_signed(8660, 16),   --  0.264295 * 32768
        8  => to_signed(8660, 16),   --  0.264295 * 32768 (Symmetric center)
        9  => to_signed(7068, 16),   --  0.215702 * 32768
        10 => to_signed(4502, 16),   --  0.137394 * 32768
        11 => to_signed(1880, 16),   --  0.057379 * 32768
        12 => to_signed(-23, 16),    -- -0.000716 * 32768
        13 => to_signed(-895, 16),   -- -0.027322 * 32768
        14 => to_signed(-910, 16),   -- -0.027764 * 32768
        15 => to_signed(-592, 16)    -- -0.018067 * 32768
    );

begin

end behavior;