library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
library std;
use std.env.all;                -- For hierarchical/external signals
use std.textio.all;  

entity tb_control is
	generic(gCLK_HPER   : time     := 50 ns;
		N	    : integer  := 6);
end tb_control;

architecture mixed of tb_control is 
	component control is 
	port(
	opcode	: in std_logic_vector(N-1 downto 0);
	Funct	: in std_logic_vector(N-1 downto 0);
	ALUSrc	: out std_logic;
	RegDst	: out std_logic;
	MemReg	: out std_logic;
	RegWr	: out std_logic;	
	MemRd	: out std_logic;
	MemWr	: out std_logic;
	Branch	: out std_logic;
	Jump	: out std_logic;
	sign	: out std_logic);
end component;

signal s_opcode	: std_logic_vector(N-1 downto 0);
signal s_Funct	: std_logic_vector(N-1 downto 0);
signal s_ALUSrc	: std_logic;
signal s_RegDst	: std_logic;
signal s_MemReg	: std_logic;
signal s_RegWr	: std_logic;
signal s_MemRd	: std_logic;
signal s_MemWr	: std_logic;
signal s_Branch	: std_logic;
signal s_Jump	: std_logic;
signal s_sign	: std_logic;

begin 
 controlUnit: control
 port map(
	opcode => s_opcode,
	Funct  => s_Funct,
	ALUSrc => s_ALUSrc,
	RegDst => s_RegDst,
	MemReg => s_MemReg,
	RegWr  => s_RegWr,
	MemRd  => s_MemRd, 
	MemWr  => s_MemWr,
	Branch => s_Branch,
	Jump   => s_Jump,
	sign   => s_sign);


TEST: process 
begin 
---test case 1: add
	s_opcode <= "000000";
	s_Funct  <= "010100";
wait for gCLK_HPER/2;
---test case 2: addi
	s_opcode <= "001000";
wait;
   end process;
end mixed;
