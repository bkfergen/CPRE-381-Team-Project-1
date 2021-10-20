library IEEE;
use IEEE.std_logic_1164.all;

entity Fetch is 
	generic(N: integer:= 32);
	port(En: in std_logic;
	     Instruction: in std_logic_vector(N-1 downto 0);
	     ReadAddr: out std_logic_vector(N-1 downto 0));
end Fetch;

	
architecture mixed of Fetch is
begin
  component mux2t1_N is
    generic(N : integer := 32); -- Generic of type integer for input/output data width. Default value is 32.
    port(i_S          : in std_logic;
         i_D0         : in std_logic_vector(N-1 downto 0);
         i_D1         : in std_logic_vector(N-1 downto 0);
         o_O          : out std_logic_vector(N-1 downto 0));
  end component;

  component addsub_N is 
  	generic(N : integer := 32); -- Generic of type integer for input/output data width. Default value is 32.
 	 port(i_C          : in std_logic;
     	      i_I1         : in std_logic_vector(N-1 downto 0);
      	      i_I2         : in std_logic_vector(N-1 downto 0);
      	      o_S          : out std_logic_vector(N-1 downto 0);
      	      o_C          : out std_logic);
  end component;