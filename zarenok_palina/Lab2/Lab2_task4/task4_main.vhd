library IEEE;
use IEEE.std_logic_1164.all;

Entity task4_main is
    Port(
        sw_i: in std_logic_vector(5 downto 0);
        led_o: out std_logic_vector(2 downto 0)
    );
End task4_main;

Architecture Structural of task4_main is
Component task_4
    Port(
        Ai, Bi: in std_logic;
        G_in, L_in, E_in: in std_logic;
        G_out, L_out, E_out: out std_logic
    );
End Component; 
signal first, second: std_logic_vector(2 downto 0);
signal L_bit1, G_bit1, E_bit1: std_logic;
signal L_bit0, G_bit0, E_bit0: std_logic;
Begin
    first <= sw_i(2 downto 0);
    second <= sw_i(5 downto 3);
    -- bit 2
    B2: task_4 port map(Ai => first(2), Bi => second(2), G_in => '0',
        L_in => '0', E_in => '1', G_out => G_bit1, L_out => L_bit1, E_out => E_bit1);
    -- bit 1
    B1: task_4 port map(Ai => first(1), Bi => second(1), G_in => G_bit1,
            L_in => L_bit1, E_in => E_bit1, G_out => G_bit0, L_out => L_bit0, E_out => E_bit0);
    -- bit 0
    B0: task_4 port map(Ai => first(0), Bi => second(0), G_in => G_bit0,
                L_in => L_bit0, E_in => E_bit0, G_out => led_o(2), L_out => led_o(1), E_out => led_o(0));
    
    -- G - led_o(2)
    -- L - led_o(1)
    -- E - led_o(0)
End Structural;