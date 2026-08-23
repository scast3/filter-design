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
    constant h : coeff_array := ( -- multipy by 2^15=32768
        0  => to_signed(-592, 16),   -- -0.018067 * 32768
        1  => to_signed(-910, 16),   -- -0.027764 * 32768
        2  => to_signed(-895, 16),   -- -0.027322 * 32768
        3  => to_signed(-23, 16),    -- -0.000716 * 32768
        4  => to_signed(1880, 16),   --  0.057379 * 32768
        5  => to_signed(4502, 16),   --  0.137394 * 32768
        6  => to_signed(7068, 16),   --  0.215702 * 32768
        7  => to_signed(8660, 16),   --  0.264295 * 32768
        8  => to_signed(8660, 16),   --  0.264295 * 32768
        9  => to_signed(7068, 16),   --  0.215702 * 32768
        10 => to_signed(4502, 16),   --  0.137394 * 32768
        11 => to_signed(1880, 16),   --  0.057379 * 32768
        12 => to_signed(-23, 16),    -- -0.000716 * 32768
        13 => to_signed(-895, 16),   -- -0.027322 * 32768
        14 => to_signed(-910, 16),   -- -0.027764 * 32768
        15 => to_signed(-592, 16)    -- -0.018067 * 32768
    );

    type prod_array is array (0 to NUM_TAPS-1) of signed(31 downto 0); -- product doubles length
    type shift_reg_array is array (0 to NUM_TAPS-1) of signed(15 downto 0);

    signal x_reg   : shift_reg_array := (others => (others => '0'));
    signal sum_reg : signed(31 downto 0) := (others => '0');
    
begin
    -- y_n <= sum h[k] * x[n-k], need multipliers and adders
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                x_reg <= (others => (others => '0')); -- reset to all zeros
                sum_reg <= (others => '0');
            else
                -- shift and add new sample
                for k in NUM_TAPS-1 downto 1 loop
                    x_reg(k) <= x_reg(k-1);
                end loop;
                x_reg(0) <= x_n;
            end if;
        end if;           
    end process;

    process(x_reg)
        variable current_sum  : signed(35 downto 0);
        variable current_prod : signed(31 downto 0);
    begin
        current_sum := (others => '0');
        for k in 0 to NUM_TAPS-1 loop
            current_prod := x_reg(k) * h(k); -- x reg is inverted x
            current_sum := current_sum + product(k);
        end loop;
        sum_reg <= current_sum;

    end process;
    y_n <= sum_reg(30 downto 15); -- get upper bits

end behavior;