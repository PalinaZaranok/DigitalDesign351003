library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Task7 is
    Port ( 
        sw_i : in std_logic_vector(2 downto 0);
        led_o : out std_logic_vector(2 downto 0)
    );
end Task7;

architecture Behavioral of Task7 is
    signal A, B, C : std_logic;
    signal Y0,Y1,Y2 : std_logic;
begin
    
    A <= sw_i(2);
    B <= sw_i(1);
    C <= sw_i(0);
    
    Y0 <= not(C);
    
    Y1 <= B and (A or C);
    
    Y2 <= A;
    
    led_o <= Y2 & Y1 & Y0;
    
end Behavioral;
