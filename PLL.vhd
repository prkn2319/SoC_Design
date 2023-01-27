library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity PLL is
	-- generic (
	-- 	WIDTH : positive := 32
	-- );
	port (
		ClkIn : in std_logic;
        CntIn : in std_logic_vector(31 downto 0);
		PLLOut : out std_logic_vector(31 downto 0)
	);
end PC;

architecture BHV of PLL is

--NOT FUNCTIONAL
begin
	
	process(PCWriteIn) 
	begin	
		if( PCWriteIn = '1') then
    		PCOut <= MuxIn;
		end if;
	end process;
end BHV;