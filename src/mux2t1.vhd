---------------------------------------------------------------------------
-- Nicklas Cahill
-- Iowa State University
---------------------------------------------------------------------------


--mux2t1.vhd
---------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of an N-bit wide 2:1
-- mux using structural VHDL, generics, and generate statements.
--
--
-- NOTES:
-- 8/27/21
---------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity mux2t1 is
  port(i_S          : in std_logic;
       i_D0         : in std_logic;
       i_D1         : in std_logic;
       o_O          : out std_logic);

end mux2t1;

architecture dataflow of mux2t1 is

   


begin

 o_O <= (i_D0 AND (NOT i_S)) OR (i_D1 AND i_S);
  
end dataflow;



















