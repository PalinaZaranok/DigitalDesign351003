library IEEE;
Use IEEE.std_logic_1164.all;

Entity task_3 is
    port(
        sw_i: in std_logic_vector(3 downto 0);
        led_o: out std_logic_vector(3 downto 0)
    );
End task_3;


Architecture Structural of task_3 is
Component TRANSPORT_DELAY is
    Generic (delay : time := 0.1 ns);
    Port (
          input: in std_logic;
          output: out std_logic
        );
End Component;

Component INV is
    Generic (delay : time := 1 ns);
    Port(
        A: in std_logic;
        F: out std_logic
    );
End Component;

Component AND2 is
    Generic (delay : time := 1 ns);
    Port(
        A, B: in std_logic;
        F: out std_logic
    );
End Component;

Component OR2 is
    Generic (delay : time := 1 ns);
    Port(
        A, B: in std_logic;
        F: out std_logic
    );
End Component;
signal nx3, nx2, nx1, nx0, x3, x2, x1, x0: std_logic;
signal y3_f1, y3_f2, y3: std_logic;
signal y2_f1, y2_f2, y2: std_logic;
signal y1_f1, y1_f2, y1_f3 ,y1: std_logic;
signal term1, term2, term3, term4,  term5, y0, value1, value2, value3, partFirst, partSecond: std_logic;
signal hF, hS, hT: std_logic;
Begin
    T0: TRANSPORT_DELAY generic map(1 ns) port map(input => sw_i(3), output => x3);
    T1: TRANSPORT_DELAY generic map(1 ns) port map(input => sw_i(2), output => x2);
    T2: TRANSPORT_DELAY generic map(1 ns) port map(input => sw_i(1), output => x1);
    T3: TRANSPORT_DELAY generic map(1 ns) port map(input => sw_i(0), output => x0);
    
    --Y3 = x2x1' + x2x0
    U0: INV generic map(0.5 ns) port map(A => x1, F => nx1);
    U1: AND2 generic map(1 ns) port map(A => x2, B => nx1, F => y3_f1);
    U2: AND2 generic map(1 ns) port map(A => x2, B => x0, F => y3_f2);
    U3: OR2 generic map(0.3 ns) port map(A => y3_f1, B => y3_f2, F => y3);
    
    --Y2 = x2x1' + x2x0'
    U4: INV generic map(0.2 ns) port map(A => x0, F => nx0);
    U5: AND2 generic map(1 ns) port map(A => x2, B => nx1, F => y2_f1);
    U6: AND2 generic map(1 ns) port map(A => x2, B => nx0, F => y2_f2);
    U7: OR2 generic map(0.3 ns) port map(A => y2_f1, B => y2_f2, F => y2);
    
    --Y1 = x3 + x1x0 + x2'x1
    U8: INV generic map(0.1 ns) port map(A => x2, F => nx2);
    U9: AND2 generic map(1 ns) port map(A => x1, B => x0, F => y1_f1);
    U10: AND2 generic map(1 ns) port map(A => nx2, B => x1, F => y1_f2);
    U11: OR2 generic map(0.5 ns) port map(A => y1_f1, B => y1_f2, F => y1_f3);
    U12: OR2 generic map(0.5 ns) port map(A => x3, B => y1_f3, F => y1);
    
    --Y0 = x3x0 + x2x1x0 + x2'x1x0' + x2'x1'x0 + x3'x2x1'x0'
    U13: INV generic map(2 ns) port map(A => x3, F => nx3);
    U14: AND2 generic map(1 ns) port map(A => x3, B => x0, F => term1); --x3x0
    
    U15: AND2 generic map(1 ns) port map(A => x2, B => x1, F => value1); --x2x1
    U16: AND2 generic map(1 ns) port map(A => value1, B => x0, F => term2); --x2x1x0
    
    U17: AND2 generic map(0.3 ns) port map(A => nx2, B => x1, F => value2);
    U18: AND2 generic map(0.7 ns) port map(A => value2, B => nx0, F => term3); --x2'x1x0'
    
    U19: AND2 generic map(0.6 ns) port map(A => nx2, B => nx1, F => value3);
    U20: AND2 generic map(0.4 ns) port map(A => value3, B => x0, F => term4); --x2'x1'x0
    
    U21: AND2 generic map(1 ns) port map(A => nx3, B => x2, F => partFirst);
    U22: AND2 generic map(1 ns) port map(A => partFirst, B => nx1, F => partSecond);
    U23: AND2 generic map(0.1 ns) port map(A => partSecond, B => nx0, F => term5); --x3'x2x1'x0'
    
    
    U24: OR2 generic map(0.9 ns) port map(A => term1, B => term2, F => hF);
    U25: OR2 generic map(1 ns) port map(A => term3, B => term4, F => hS);
    U26: OR2 generic map(0.5 ns) port map(A => hF, B => hS, F => hT);
    U27: OR2 generic map(1 ns) port map(A => hT, B => term5, F => y0);
    
    led_o <= y3 & y2 & y1 & y0; 
End Structural;