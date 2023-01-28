library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGA_LIB.all;

entity block_row is
	port (
		Vcount 	 : in std_logic_vector(9 downto 0);
		Row_Addr : out std_logic_vector(4 downto 0);
		Score_en 	 : out std_logic);		
end block_row;

architecture BHV of block_row is

begin
	
	process(Vcount)
		
		variable temp : unsigned(9 downto 0);
	
		begin
			-- draw center
			if (unsigned(Vcount) >= P1_Y_START AND unsigned(Vcount) <= P1_Y_END) then
				temp := (unsigned(Vcount) - P1_Y_START)/2;
				Score_en <='1';
			else 
				temp := (others => '0');
				Score_en <='0';
			end if;
		
		Row_Addr <= std_logic_vector(temp(4 downto 0));
	end process;
end BHV;