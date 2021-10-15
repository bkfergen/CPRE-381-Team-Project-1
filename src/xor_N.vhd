library IEEE;
use IEEE.std_logic_1164.all;

entity xor_N is

  generic(N         : integer := 32);
  port(i_A          : in std_logic_vector(N-1 downto 0);
       i_B          : in std_logic_vector(N-1 downto 0);
       o_F          : out std_logic_vector(N-1 downto 0));

end xor_N;

architecture structural of xor_N is

  component xorg2 is
    port(i_A          : in std_logic;
         i_B          : in std_logic;
         o_F          : out std_logic);
  end component;

begin

  G_NBit_XOR: for i in 0 to N-1 generate
    XorI: xorg2 port map(
              i_A      => i_A(i),
              i_B      => i_B(i),
              o_F      => o_F(i));
  end generate G_NBit_XOR;
  
end structural;