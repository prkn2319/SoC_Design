library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGA_LIB.all;

entity block_col is
	port (
		Hcount 	 : in std_logic_vector(9 downto 0);
		Col_Addr : out std_logic_vector(4 downto 0);
		PS_en 	 : out std_logic_vector(1 downto 0));		
end block_col;

architecture BHV of block_col is

begin
	
	process(Hcount)
		
		variable temp : unsigned(9 downto 0);
	
		begin
		-- draw center
			if (unsigned(Hcount) >= P1_X_START AND unsigned(Hcount) <= P1_X_END) then
				temp := (unsigned(Hcount) - P1_X_START);
				PS_en <="01";
			elsif (unsigned(Hcount) >= P2_X_START AND unsigned(Hcount) <= P2_X_END) then
				temp := (unsigned(Hcount) - P2_X_START);
				PS_en <="10";
			else 
				temp := (others => '0');
				PS_en <="00";
			end if;
		
		Col_Addr <= std_logic_vector(temp(4 downto 0));
	end process;
end BHV;