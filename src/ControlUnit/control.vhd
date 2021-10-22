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
	sign: out std_logic;
	ALU_Op: out std_logic_vector(9 downto 1));
end control;

architecture mixed of control is 
begin 
process(opcode, Funct) 
	begin 
		if(opcode = "000000") then  --R-format 
			case Funct is
			when "100001" =>  -- addu
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000000001";
			when  "100011" =>  -- subu
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000000011";
			when  "010100" =>  -- add
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000000001";
			when  "100100" =>  -- and
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000001000";
			when  "100111" =>  -- nor
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000010000";
			when  "100110" =>  -- xor
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000100000";
			when  "100101" =>  -- or
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000000100";
			when  "101010" =>  -- slt
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "100000000";
			when  "000000" =>  -- sll
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000000000"; -- NOT IN ALU YET
			when  "000010" =>  -- srl
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000000000"; -- NOT IN ALU YET
			when  "000011" =>  -- sra
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000000000"; -- NOT IN ALU YET
			when  "100010" =>  -- sub
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '0';
				ALU_Op <= "000000011";
			when others =>   -- others, signed (jr)
				ALUSrc <= '0';
				RegDst <= '1';
				MemReg <= '0';
				RegWr  <= '1';	
				MemRd  <= '0';
				MemWr  <= '0';
				Branch <= '0';
				Jump   <= '0';
				sign   <= '1';
				ALU_Op <= "000000000";
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
				ALU_Op <= "000000001";
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
				ALU_Op <= "000000001";		
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
				ALU_Op <= "000001000";	
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
				ALU_Op <= "000000000";	
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
				ALU_Op <= "000000000";
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
				ALU_Op <= "000100000";
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
				ALU_Op <= "000000100";
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
				ALU_Op <= "100000000";
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
				ALU_Op <= "000000000";
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
				ALU_Op <= "010000000"; -- Output is in o_Zero
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
				ALU_Op <= "000000000"; -- Output is in o_Zero
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
				ALU_Op <= "000000000";
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
				ALU_Op <= "001000000";
			when OTHERS => NULL;
			end case;
		end if;
end process;
end mixed;