library IEEE;
Use IEEE.std_logic_1164.all;

Entity testbench is 
End testbench;

Architecture Behavioral of testbench is
component task_3 is
    port(
        sw_i: in std_logic_vector(3 downto 0);
        led_o: out std_logic_vector(3 downto 0)
        );
end component;  
signal sw_i: std_logic_vector(3 downto 0);
signal led_o: std_logic_vector(3 downto 0);
Begin  
    UUT: task_3 port map(sw_i => sw_i, led_o => led_o);
    
    sw_i <= "0000";
    assert led_o = "0000" report "Step 1";
    
    sw_i <= "0001";
    assert led_o = "0001" report "Step 2";
       
    sw_i <= "0011";
    assert led_o = "0010" report "Step 3";  
            
    sw_i <= "0010";
    assert led_o = "0011" report "Step 4";  
                
    sw_i <= "0110";
    assert led_o = "0100" report "Step 5";  
                    
    sw_i <= "0111";
    assert led_o = "1011" report "Step 6";  
                                    
     sw_i <= "0101";
     assert led_o = "1100" report "Step 7";
     
     sw_i <= "0100";
     assert led_o = "1101" report "Step 8";
     
     sw_i <= "1100";
     assert led_o = "1110" report "Step 9";
     
     sw_i <= "1101";
     assert led_o = "1111" report "Step 10";
      
End Behavioral;