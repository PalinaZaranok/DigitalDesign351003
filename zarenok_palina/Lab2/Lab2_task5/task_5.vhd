library IEEE;
use IEEE.std_logic_1164.all;

Entity task_5 is
    Port(
        Q, nQ: out std_logic
    );
End task_5;

Architecture Behavioral of task_5 is
signal s0, s1: std_logic;
Begin
    s0 <= not s1;
    s1 <= not s0;
    nQ <= s0;
    Q <= s1;
End Behavioral;