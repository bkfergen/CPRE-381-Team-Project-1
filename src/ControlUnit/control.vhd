library IEEE;
use IEEE.std_logic_1164.all;

entity control is 
	generic(N: integer:= 6);

	port(
	opcode: in std_logic_vector(N-1 downto 0);
	Funct: in std_logic_vector(N-1 downto 0);
	ALUSrc: out std_logic;
	RegDst: out std_logic;
	MemReg: out std_logic;
	RegWr: out std_logic;	
	MemRd: out std_logic;
	MemWr: out std_logic;
	Branch: out std_logic;
	Jump: out std_logic;
	sign: out std_logic);
end control;

architecture mixed of control is 
begin 
process(opcode, Funct) 
	begin 
		if(opcode = "000000") then  --R-format 
			case Funct is
			when "100001" =>  --unsigned (addu | subu)
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
			when  "100011" =>  --unsigned (addu | subu)
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
			when others =>   --signed (add, and, nor, xor, or, slt, sll, srl, sra, sub, jr)
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '1';		
				end case;		
		else
			case opcode is 
			when "001000" => -- addi
				ALUSrc <= '1';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '1';
			when "001001" => -- addiu
				ALUSrc <= '1';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';		
			when "001100" => -- andi
				ALUSrc <= '1';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '1';		
			when "001111" => -- lui 
				ALUSrc <= '1';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';		
			when "100011" => -- lw
				ALUSrc <= '1';
				RegDst <= '0';
				MemReg <= '1';
				RegWr  <= '1';	
				MemRd  <= '1';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '1';	
			when "001110" => -- xori
				ALUSrc <= '1';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';	--zeroExt because ori is zeroExt 
			when "001101" => -- ori
				ALUSrc <= '1';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
			when "001010" => -- slti
				ALUSrc <= '1';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '1';		
			when "101011" => -- sw
				ALUSrc <= '1';
				RegDst <= '0';
				MemReg <= '0';
				RegWr  <= '0';	
				MemRd  <= '0';
				MemWr  <= '1';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '1';		
			when "000100" => -- beq
				ALUSrc <= '0';
				RegDst <= '0';
				MemReg <= '0';
				RegWr  <= '0';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '1';
				Jump   <= '0';
				sign   <= '0';		
			when "000101" => -- bne
				ALUSrc <= '0';
				RegDst <= '0';
				MemReg <= '0';
				RegWr  <= '0';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '1';
				Jump   <= '0';
				sign   <= '0';	
			when "000010" => -- j
				ALUSrc <= '0';
				RegDst <= '0';
				MemReg <= '0';
				RegWr  <= '0';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '1';
				sign   <= '0';		
			when "011111" => -- repl.qb
				ALUSrc <= '1';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '1';
			when OTHERS => NULL;
			end case;
		end if;
end process;
end mixed;