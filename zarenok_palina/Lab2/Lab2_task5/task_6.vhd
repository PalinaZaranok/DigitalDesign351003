library IEEE;
use IEEE.std_logic_1164.all;

Entity task_6 is
    Port(
        Q, nQ: out std_logic;
        S, R: in std_logic
    );
End task_6;

Architecture Behavioral of task_6 is
signal s0, s1: std_logic;
Begin
    ---s0 <= S nor s1
    ---s1 <= s0 nor R
    P0: process(s1, S)
    begin 
    s0 <= not (s1 or S);
    end process P0;
    
    P1: process(s0, R)
    begin
    s1 <= not (s0 or R);
    end process P1;
    
    nQ <= s0;
    Q <= s1;
    
End Behavioral;