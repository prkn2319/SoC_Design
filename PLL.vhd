library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity PLL is
	-- generic (
	-- 	WIDTH : positive := 32
	-- );
	port (
		ClkIn, Reset : in std_logic;
        CntIn : in std_logic_vector(31 downto 0);
		PLLOut : out std_logic_vector(31 downto 0)
	);
end PC;

architecture BHV of PLL is

--NOT FUNCTIONAL
begin
	
	process(clk,reset)
	begin
		if(reset='1') then
			count<=1;
			tmp<='0';
		elsif(clk'event and clk='1') then
			count <=count+1;
			if (count = 25000) then
				tmp <= NOT tmp;
				count <= 1;
			end if;
		end if;
	clock_out <= tmp;
	end process;
	
end BHV;