library IEEE;

Use IEEE.std_logic_1164.all;
Entity INV is
    Generic (delay : time := 1 ns);
    Port(
        A: in std_logic;
        F: out std_logic
    );
End INV;

Architecture Behavior of INV is
Begin
    F <= not A after delay;
End Behavior;    