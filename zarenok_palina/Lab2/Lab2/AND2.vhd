library IEEE;

Use IEEE.std_logic_1164.all;
Entity AND2 is
    Port(
        A, B: in std_logic;
        F: out std_logic
    );
End AND2;

Architecture Behavior of AND2 is
Begin
    F <= A and B;
End Behavior;    