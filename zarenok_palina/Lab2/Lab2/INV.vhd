library IEEE;

Use IEEE.std_logic_1164.all;
Entity INV is
    Port(
        A: in std_logic;
        F: out std_logic
    );
End INV;

Architecture Behavior of INV is
Begin
    F <= not A;
End Behavior;    