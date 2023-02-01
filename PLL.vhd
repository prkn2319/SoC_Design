library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity PLL is
    generic(clk_in_freq  : natural := 50000000;  -- Input clock frequency
            clk_out_freq : natural := 1000); -- Output clock frequency
    port (
        clk_in  : in  std_logic;
        clk_out : out std_logic;
        rst     : in  std_logic);
end PLL;


architecture arch of PLL is

	signal count : integer;
	signal clk : std_logic := '0';

begin

	process(clk_in, rst)
	begin
		
		if (rst = '1') then
			clk <= '0';
			count <= 0;
		
		elsif (rising_edge(clk_in)) then
			
			if (count = (clk_in_freq/(clk_out_freq*2))) then
				count <= 0;
				
				if (clk = '0') then
					clk <= '1';
				else
					clk <= '0';
				end if;
				
			else
				count <= count + 1;
				
			end if;
		end if;
	end process;
	
	clk_out <= clk;

end arch;