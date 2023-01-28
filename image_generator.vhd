
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGA_LIB.all;

entity image_generator is
	generic (WIDTH : positive := 10);
	port (
		clk		  : in std_logic;
		
		h_count   : in std_logic_vector(9 downto 0);
		v_count   : in std_logic_vector(9 downto 0);
		vid_en    : in std_logic;
		
		ball_x    : in std_logic_vector(WIDTH-1 downto 0);
        ball_y    : in std_logic_vector(WIDTH-1 downto 0);
        left_pad  : in std_logic_vector(WIDTH-1 downto 0);
        right_pad : in std_logic_vector(WIDTH-1 downto 0);
		score1    : in integer;
		score2	  : in integer;
		
        red, green, blue : out std_logic_vector(3 downto 0));
end image_generator;

architecture BHV of image_generator is
	
	signal ROM_ADDRESS : std_logic_vector(9 downto 0);
	signal PS_en : std_logic_vector(1 downto 0);
	signal Score_en : std_logic; 

begin
		
	U_BLOCK_COL : entity work.block_col port map (
		Hcount => h_count,
		Col_Addr => ROM_ADDRESS(4 downto 0),
		PS_en => PS_en);
		
	U_BLOCK_ROW : entity work.block_row port map (
		Vcount => v_count,
		Row_Addr => ROM_ADDRESS(9 downto 5),
		Score_en => Score_en);	
		
		
	-- need to include 11 vivado rom instances (10 digits 32x32, 1 ball 16x16)
		
	process(clk)
	begin
		red <= (others => '0');
		green <= (others => '0');
		blue <= (others => '0');
		
		if (vid_en = '1') then
			
			--score
			if (Score_en = '1' and PS_en = "01") then
				--display p1 score from rom
			elsif (Score_en = '1' and PS_en = "10") then
				--display p2 score from rom
			end if;
			
			--ball
			if (unsigned(h_count) >= unsigned(ball_x) and unsigned(h_count) <= unsigned(ball_x)+15 and unsigned(v_count) >= unsigned(ball_y) and unsigned(v_count) <= unsigned(ball_y)+15 ) then
				--display ball from rom
			end if;
			
			--paddle1
			if (unsigned(h_count) >= 13 and unsigned(h_count) <= 20 and unsigned(v_count) >= unsigned(left_pad) and unsigned(v_count) <= unsigned(left_pad)+47 ) then
				red <= (others => '1');
			end if;
			
			--paddle2
			if (unsigned(h_count) >= 620 and unsigned(h_count) <= 627 and unsigned(v_count) >= unsigned(right_pad) and unsigned(v_count) <= unsigned(right_pad)+47 ) then
				green <= (others => '1');
			end if;
			
		end if;
		
	end process;	
end BHV;