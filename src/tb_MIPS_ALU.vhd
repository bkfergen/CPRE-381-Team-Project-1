library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mips_alu is
  generic(gCLK_HPER   : time := 20 ns);
end tb_mips_alu;

architecture behavior of tb_mips_alu is
  
  -- Calculate the clock period as twice the half-period
  constant cCLK_PER  : time := gCLK_HPER * 2;

  component mips_alu is
  generic(N       : integer := 32);
  port(i_Data1    : in std_logic_vector(N-1 downto 0);    -- Data input 1
       i_Data2    : in std_logic_vector(N-1 downto 0);    -- Data input 2
       i_C1       : in std_logic;                         -- Control 1 (1 = add/sub to output)
       i_C2       : in std_logic;                         -- Control 2 (0 = add, 1 = sub)
       i_C3       : in std_logic;                         -- Control 3 (1 = or to output)
       i_C4       : in std_logic;                         -- Control 4 (1 = and to output)
       i_C5       : in std_logic;                         -- Control 5 (1 = nor to output)
       i_C6       : in std_logic;                         -- Control 6 (1 = xor to output)
       i_C7       : in std_logic;                         -- Control 7 (1 = reql.qb to output)
       o_Overflow : out std_logic;                        -- Overflow (1 = ovf, 0 = no ovf)
       o_Output   : out std_logic_vector(N-1 downto 0));  -- Data output
  end component;

  -- Temporary signals to connect to the dff component.
  signal s_CLK : std_logic;
  signal s_Data1 : std_logic_vector(31 downto 0);
  signal s_Data2 : std_logic_vector(31 downto 0);
  signal s_Output : std_logic_vector(31 downto 0);
  signal s_C1 : std_logic;
  signal s_C2 : std_logic;
  signal s_C3 : std_logic;
  signal s_C4 : std_logic;
  signal s_C5 : std_logic;
  signal s_C6 : std_logic;
  signal s_C7 : std_logic;
  signal s_Overflow : std_logic;

begin

  DUT: mips_alu
  generic map(N => 32)
  port map(i_Data1 => s_Data1,          -- Data input 1
           i_Data2 => s_Data2,          -- Data input 2
           i_C1 => s_C1,                -- Control 1 (1 = add/sub to output)
           i_C2 => s_C2,                -- Control 2 (0 = add, 1 = sub)
           i_C3 => s_C3,                -- Control 3 (1 = or to output)
           i_C4 => s_C4,                -- Control 4 (1 = and to output)
           i_C5 => s_C5,                -- Control 5 (1 = nor to output)
           i_C6 => s_C6,                -- Control 6 (1 = xor to output)
           i_C7 => s_C7,                -- Control 7 (1 = reql.qb to output)
           o_Overflow => s_Overflow,    -- Overflow (1 = ovf, 0 = no ovf)
           o_Output => s_Output);       -- Data output

  -- This process sets the clock value (low for gCLK_HPER, then high
  -- for gCLK_HPER). Absent a "wait" command, processes restart 
  -- at the beginning once they have reached the final statement.
  P_CLK: process
  begin
    s_CLK <= '0';
    wait for gCLK_HPER;
    s_CLK <= '1';
    wait for gCLK_HPER;
  end process;
  
  -- Testbench process  
  P_TB: process
  begin
    -- run 325
    s_Data1 <= "00000000000000000000000000000000";
    s_Data2 <= "00000000000000000000000000000000";
    s_C1 <= '0';
    s_C2 <= '0';
    s_C3 <= '0';
    s_C4 <= '0';
    s_C5 <= '0';
    s_C6 <= '0';
    s_C7 <= '0';
    wait for cCLK_PER;

-- Test add (s_Output should be "...0010"
    s_Data1 <= "00000000000000000000000000000001";
    s_Data2 <= "00000000000000000000000000000001";
    s_C1 <= '1';
    s_C2 <= '0';
    s_C3 <= '0';
    s_C4 <= '0';
    s_C5 <= '0';
    s_C6 <= '0';
    s_C7 <= '0';
    wait for cCLK_PER;

-- Test sub (s_Output should be "...0000"
    s_Data1 <= "00000000000000000000000000000001";
    s_Data2 <= "00000000000000000000000000000001";
    s_C1 <= '1';
    s_C2 <= '1';
    s_C3 <= '0';
    s_C4 <= '0';
    s_C5 <= '0';
    s_C6 <= '0';
    s_C7 <= '0';
    wait for cCLK_PER;

-- Test or (s_Output should be "...1011"
    s_Data1 <= "00000000000000000000000000001001";
    s_Data2 <= "00000000000000000000000000000011";
    s_C1 <= '0';
    s_C2 <= '0';
    s_C3 <= '1';
    s_C4 <= '0';
    wait for cCLK_PER;

-- Test and (s_Output should be "...0001"
    s_Data1 <= "00000000000000000000000000001001";
    s_Data2 <= "00000000000000000000000000000011";
    s_C1 <= '0';
    s_C2 <= '0';
    s_C3 <= '0';
    s_C4 <= '1';
    s_C5 <= '0';
    s_C6 <= '0';
    s_C7 <= '0';
    wait for cCLK_PER;

-- Test nor (s_Output should be "1111...0100"
    s_Data1 <= "00000000000000000000000000001001";
    s_Data2 <= "00000000000000000000000000000011";
    s_C1 <= '0';
    s_C2 <= '0';
    s_C3 <= '0';
    s_C4 <= '0';
    s_C5 <= '1';
    s_C6 <= '0';
    s_C7 <= '0';
    wait for cCLK_PER;

-- Test xor (s_Output should be "...1010"
    s_Data1 <= "00000000000000000000000000001001";
    s_Data2 <= "00000000000000000000000000000011";
    s_C1 <= '0';
    s_C2 <= '0';
    s_C3 <= '0';
    s_C4 <= '0';
    s_C5 <= '0';
    s_C6 <= '1';
    s_C7 <= '0';
    wait for cCLK_PER;

-- Test repl.qb (s_Output should be "||10100011|| x 4"
    s_Data1 <= "00000000000000000000000000000000"; --Only uses imm (read into data 2)
    s_Data2 <= "00000000000000000000000010100011";
    s_C1 <= '0';
    s_C2 <= '0';
    s_C3 <= '0';
    s_C4 <= '0';
    s_C5 <= '0';
    s_C6 <= '0';
    s_C7 <= '1';
    wait for cCLK_PER;

    wait;
  end process;
  
end behavior;