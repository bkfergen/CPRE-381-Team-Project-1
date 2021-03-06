library IEEE;
use IEEE.std_logic_1164.all;

entity replqb_N is

  generic(N         : integer := 32);
  port(i_A          : in std_logic_vector(N-1 downto 0);
       o_F          : out std_logic_vector(N-1 downto 0));

end replqb_N;

architecture structural of replqb_N is

begin

  G_NBit_1: for i in 0 to 7 generate
    o_F(i) <= i_A(i);
  end generate G_NBit_1;

  G_NBit_2: for i in 0 to 7 generate
    o_F(i+8) <= i_A(i);
  end generate G_NBit_2;

  G_NBit_3: for i in 0 to 7 generate
    o_F(i+16) <= i_A(i);
  end generate G_NBit_3;

  G_NBit_4: for i in 0 to 7 generate
    o_F(i+24) <= i_A(i);
  end generate G_NBit_4;
  
end structural;