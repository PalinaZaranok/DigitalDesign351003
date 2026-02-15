library ieee;
use ieee.std_logic_1164.all;

-- I = $3A
-- J = $6E

-- I = 0011 1010
-- J = 0110 1110

-- J = (not X) xor I
-- not X = J xor I = 0101 0100
-- X = 1010 1011

entity tsk3_top is
    port (
        led_out : out std_logic_vector(15 downto 0);
        sw_in : in std_logic_vector(15 downto 0)
    );
end tsk3_top;

architecture rtl of tsk3_top is
    signal i : std_logic_vector(7 downto 0);
    signal not_x : std_logic_vector(7 downto 0);
begin
    i <= "00111010";
    not_x <= not sw_in(7 downto 0);
    led_out(7 downto 0) <= i xor not_x;
    led_out(15 downto 8) <= "00000000";
end rtl;