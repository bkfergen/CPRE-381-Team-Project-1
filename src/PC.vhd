library IEEE;
use IEEE.std_logic_1164.all;

entity PC is
   generic(N: integer := 32);
   port(i_CLK        : in std_logic;  
        i_RST        : in std_logic;
        i_WE         : in std_logic;    
        i_D          : in std_logic_vector(N-1 downto 0);   
        o_Q          : out std_logic_vector(N-1 downto 0));   

end PC;

architecture structure of PC is
  signal s_D    : std_logic_vector(N-1 downto 0);    -- Multiplexed input to the FF
  signal s_Q    : std_logic_vector(N-1 downto 0);    -- Output of the FF

begin

  -- The output of the FF is fixed to s_Q
  o_Q <= s_Q;
  
  -- Create a multiplexed input to the FF based on i_WE
  with i_WE select
    s_D <= i_D when '1',
           s_Q when others;
  
  process (i_CLK, i_RST)
  begin
    if (i_RST = '1') then
      s_Q <= x"00400000";
    elsif (rising_edge(i_CLK)) then
      s_Q <= s_D;
    end if;

  end process;

--  with i_RST select
 --   s_Q <= x"00400000" when '1',
--           s_D when others;
  
end structure;
