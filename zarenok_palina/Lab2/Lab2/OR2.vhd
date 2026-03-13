library IEEE;

Use IEEE.std_logic_1164.all;
Entity OR2 is
    Port(
        A, B: in std_logic;
        F: out std_logic
    );
End OR2;

Architecture Behavior of OR2 is
Begin
    F <= A or B;
End Behavior;    