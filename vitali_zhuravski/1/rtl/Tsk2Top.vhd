library ieee;
use ieee.std_logic_1164.all;

-- K = $D723
-- N = 16
-- K = 1101 0111 0010 0011

entity tsk2_top is
    port (
        led_out : out std_logic_vector(15 downto 0);
        sw_in : in std_logic_vector(15 downto 0)
    );
end tsk2_top;

architecture rtl of tsk2_top is
begin
    led_out <= sw_in;
end rtl;