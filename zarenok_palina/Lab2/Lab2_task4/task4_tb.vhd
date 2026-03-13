library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;

Entity task4_tb is 
End task4_tb;

Architecture Behavioral of task4_tb is
component task4_main is
    port(
         sw_i: in std_logic_vector(5 downto 0);
         led_o: out std_logic_vector(2 downto 0)
        );
end component;  
signal sw_i: std_logic_vector(5 downto 0);
signal led_o: std_logic_vector(2 downto 0);
Begin  
    UUT: task4_main port map(sw_i => sw_i, led_o => led_o);
   
   P0: process
   variable A, B: integer;
   begin
        --G
       A := 7;
       B := 2; 
       sw_i <= std_logic_vector(to_unsigned(B, 3)) & std_logic_vector(to_unsigned(A, 3));
       wait for 10 ns;
       assert led_o = "100" report "Test G failed" severity error;
       
       --L
       A := 2;
       B := 3;
       sw_i <= std_logic_vector(to_unsigned(B, 3)) & std_logic_vector(to_unsigned(A, 3));
       wait for 10 ns;
       assert led_o = "010" report "Test L failed" severity error;
        
       --E 
       A := 2;
       B := 2;
       sw_i <= std_logic_vector(to_unsigned(B, 3)) & std_logic_vector(to_unsigned(A, 3));
       wait for 10 ns;
       assert led_o = "001" report "Test E failed" severity error;   
     
     wait;
   end process; 
              
End Behavioral;