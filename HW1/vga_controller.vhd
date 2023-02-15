
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGA_LIB.all;

entity vga_controller is
	port (
		clk : in std_logic;
		rst : in std_logic;
		h_count : out std_logic_vector(9 downto 0);
		v_count : out std_logic_vector(9 downto 0);
		h_sync : out std_logic;
		v_sync : out std_logic;
		video_on : out std_logic);
end vga_controller;

architecture BHV of vga_controller is 
	
	signal Hcounttemp : unsigned(9 downto 0);
	signal Vcounttemp : unsigned(9 downto 0);
	
begin

	process(clk, rst)
		
		begin 
			if (rst = '1') then
				Hcounttemp <= (others => '0');
				Vcounttemp <= (others => '0');			
	
				
			elsif (rising_edge(clk)) then 
				
				Hcounttemp <= Hcounttemp + 1;
				
				if (Hcounttemp = H_MAX) then 
					Hcounttemp <= (others => '0');
				end if;
				
				if (Hcounttemp = H_VERT_INC) then
					Vcounttemp <= Vcounttemp + 1;
					
					if (Vcounttemp = V_MAX) then 
						Vcounttemp <= (others => '0');
					end if;
					
				end if;			
			end if;
	end process;
	
	h_count <= std_logic_vector(Hcounttemp);
	v_count <= std_logic_vector(Vcounttemp);
	h_sync <= '0' when (Hcounttemp >= HSYNC_BEGIN AND Hcounttemp <= HSYNC_END) else '1';
	v_sync <= '0' when (Vcounttemp >= VSYNC_BEGIN AND Vcounttemp <= VSYNC_END) else '1';
	video_on <= '1' when (Hcounttemp <= H_DISPLAY_END AND Vcounttemp <= V_DISPLAY_END) else '0';
	
end BHV;