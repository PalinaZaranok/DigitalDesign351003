library IEEE;
Use IEEE.std_logic_1164.all;

Entity task_4 is
    Port(
        Ai, Bi: in std_logic;
        G_in, L_in, E_in: in std_logic;
        G_out, L_out, E_out: out std_logic
    );
End task_4;


Architecture Structural of task_4 is

Component INV is
    Port(
        A: in std_logic;
        F: out std_logic
    );
End Component;

Component AND2 is
    Port(
        A, B: in std_logic;
        F: out std_logic
    );
End Component;

Component OR2 is
    Port(
        A, B: in std_logic;
        F: out std_logic
    );
End Component;

Component XOR2 is
    Port(
        A, B: in std_logic;
        F: out std_logic
    );
End Component;
signal nAi, nBi, L_bit, E_bit, G_bit, value, res, and_low: std_logic;
Begin
    -- A <  B
    U0: INV port map(A => Ai, F => nAi);
    U1: AND2 port map(A => nAi, B => Bi, F => L_bit);  
    
    -- A = B
    U2: XOR2 port map(A => Ai, B => Bi, F => value);  
    U3: INV port map(A => value, F => E_bit);
    
    -- A > B
    U4: INV port map(A => Bi, F => nBi);
    U5: AND2 port map(A => Ai, B => nBi, F => G_bit);
    
    
    
    U6: AND2 port map(A => E_bit, B => E_in, F => E_out);
    
    U7: AND2 port map(A => E_in, B => G_bit, F => res);
    U8: OR2 port map(A => G_in, B => res, F => G_out);
    
    U9: AND2 port map(A => E_in, B => L_bit, F => and_low);
    U10: OR2 port map(A => L_in, B => and_low, F => L_out);
    
End Structural;