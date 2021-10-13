library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity mips_alu is

  generic(N       : integer := 32);
  port(i_Data1    : in std_logic_vector(N-1 downto 0);    -- Data input 1
       i_Data2    : in std_logic_vector(N-1 downto 0);    -- Data input 2
       i_C1       : in std_logic;                         -- Control 1 (1 = add/sub to output)
       i_C2       : in std_logic;                         -- Control 2 (0 = add, 1 = sub)
       i_C3       : in std_logic;                         -- Control 3 (1 = or to output)
       i_C4       : in std_logic;                         -- Control 4 (1 = and to output)
       o_Overflow : out std_logic;                         -- Overflow (1 = ovf, 0 = no ovf)
       o_Output   : out std_logic_vector(N-1 downto 0));   -- Data output

end mips_alu;

architecture structural of mips_alu is

  component addsub_N is
    generic(N         : integer := 32); -- Generic of type integer for input/output data width. Default value is 32.
    port(i_C          : in std_logic;
         i_I1         : in std_logic_vector(N-1 downto 0);
         i_I2         : in std_logic_vector(N-1 downto 0);
         o_S          : out std_logic_vector(N-1 downto 0);
         o_C          : out std_logic);

  end component;

  component or_N is
    generic(N         : integer := 32);
    port(i_A          : in std_logic_vector(N-1 downto 0);
         i_B          : in std_logic_vector(N-1 downto 0);
         o_F          : out std_logic_vector(N-1 downto 0));
  end component;

  component and_N is
    generic(N         : integer := 32);
    port(i_A          : in std_logic_vector(N-1 downto 0);
         i_B          : in std_logic_vector(N-1 downto 0);
         o_F          : out std_logic_vector(N-1 downto 0));
  end component;

  component mux2t1_N is
    generic(N : integer := 32); -- Generic of type integer for input/output data width. Default value is 32.
    port(i_S          : in std_logic;
         i_D0         : in std_logic_vector(N-1 downto 0);
         i_D1         : in std_logic_vector(N-1 downto 0);
         o_O          : out std_logic_vector(N-1 downto 0));
  end component;

  -- ALU Operation Outputs
  signal s_Output1 : std_logic_vector(N-1 downto 0) := (others => '0');
  signal s_Output2 : std_logic_vector(N-1 downto 0) := (others => '0');
  signal s_Output3 : std_logic_vector(N-1 downto 0) := (others => '0');
  signal s_ALU_Adder_Output : std_logic_vector(N-1 downto 0) := (others => '0');
  signal s_ALU_Or_Output : std_logic_vector(N-1 downto 0) := (others => '0');
  signal s_ALU_And_Output : std_logic_vector(N-1 downto 0) := (others => '0');

begin

  -- OPERATIONS
  ALU_Adder: addsub_N
  generic map(N => N)
  port map(i_C => i_C2,
           i_I1 => i_Data1,
           i_I2 => i_Data2,
           o_S => s_ALU_Adder_Output,
           o_C => o_Overflow);

  ALU_Or: or_N
  port map(i_A => i_Data1,
           i_B => i_Data2,
           o_F => s_ALU_Or_Output);

  ALU_And: and_N
  port map(i_A => i_Data1,
           i_B => i_Data2,
           o_F => s_ALU_And_Output);

  -- DETERMINE OUTPUT
  ALU_Adder_Output_Mux: mux2t1_N
  generic map(N => N)
  port map(i_S => i_C1,
           i_D0 => "00000000000000000000000000000000",
           i_D1 => s_ALU_Adder_Output,
           o_O => s_Output1);

  ALU_Or_Output_Mux: mux2t1_N
  generic map(N => N)
  port map(i_S => i_C3,
           i_D0 => s_Output1,
           i_D1 => s_ALU_Or_Output,
           o_O => s_Output2);

  ALU_And_Output_Mux: mux2t1_N
  generic map(N => N)
  port map(i_S => i_C4,
           i_D0 => s_Output2,
           i_D1 => s_ALU_And_Output,
           o_O => s_Output3);

  o_Output <= s_Output3;

end structural;