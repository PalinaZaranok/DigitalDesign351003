library IEEE;
use IEEE.std_logic_1164.all;

Entity TRANSPORT_DELAY is 
    Generic (delay : time := 0.1 ns);
    Port (
        input: in std_logic;
        output: out std_logic
    );
End TRANSPORT_DELAY;

Architecture Behavioral of TRANSPORT_DELAY is
Begin
    output <= transport input after delay;
End Behavioral;