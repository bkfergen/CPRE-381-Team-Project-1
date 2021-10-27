library IEEE;
use IEEE.std_logic_1164.all;

entity nreg is
  generic(N         : integer := 32); -- Generic of type integer for input/output data width. Default value is 32.
  port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic_vector(N-1 downto 0);     -- Data value input
       o_Q          : out std_logic_vector(N-1 downto 0));   -- Data value output

end nreg;

architecture structural of nreg is
  
  component dffg is

  port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic;     -- Data value input
       o_Q          : out std_logic);   -- Data value output

  end component;


begin

  -- Instantiate N dffg instances.
  G_NBit_dffg: for i in 0 to N-1 generate
    DFFG_I: dffg port map(i_CLK   => i_CLK,
                              i_RST   => i_RST,
                              i_WE    => i_WE,
                              i_D     => i_D(i),
                              o_Q     => o_Q(i));
  end generate G_NBit_dffg;
  
end structural;