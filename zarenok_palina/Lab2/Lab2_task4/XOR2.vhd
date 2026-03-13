library IEEE;
Use IEEE.std_logic_1164.all;

Entity XOR2 is
    Port(
        A, B: in std_logic;
        F: out std_logic
    );
End XOR2;

Architecture Behavior of XOR2 is
Begin
    F <= A xor B after 3 ns;
End Behavior;    