
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
		score1    : in std_logic_vector(3 downto 0);
		score2	  : in std_logic_vector(3 downto 0);
		
		red, green, blue : out std_logic_vector(3 downto 0));
end image_generator;

architecture BHV of image_generator is
	
	--rom addresses
	signal score_rom_addr : std_logic_vector(9 downto 0);
	signal ball_rom_addr  : std_logic_vector(7 downto 0);
	
	--enable signals
	signal PS_en : std_logic_vector(1 downto 0);
	signal Score_en : std_logic; 
	signal ball_en : std_logic;
	
	--rgb values
	type   scores_t is array(0 to 15) of std_logic_vector(11 downto 0); 
	signal rgb_scores : scores_t;
	signal rgb_ball : std_logic_vector(11 downto 0);

begin
		
	-- score display
	U_BLOCK_COLS : entity work.block_col port map (
		Hcount => h_count,
		Col_Addr => score_rom_addr(4 downto 0),
		PS_en => PS_en);
		
	U_BLOCK_ROWS : entity work.block_row port map (
		Vcount => v_count,
		Row_Addr => score_rom_addr(9 downto 5),
		Score_en => Score_en);	
		
	--ball display
	U_BLOCK_BALL : entity work.block_row_col_ball port map (
		Vcount => v_count, 
		Hcount => h_count, 
		ball_x => ball_x,
		ball_y => ball_y,
		Rom_Addr => ball_rom_addr,
		Ball_en => ball_en);	
		
	--rom for ball rgb
	U_ROM_BALL : entity work.img_rom_16bit port map (
		clka => clk,
		addra => ball_rom_addr,
		douta => rgb_ball);
		
	--roms for each score rgb
	U_ROM_SCR0 : entity work.img_rom_32bit_0 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(0));
		
	U_ROM_SCR1 : entity work.img_rom_32bit_1 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(1));
		
	U_ROM_SCR2 : entity work.img_rom_32bit_2 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(2));
		
	U_ROM_SCR3 : entity work.img_rom_32bit_3 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(3));
		
	U_ROM_SCR4 : entity work.img_rom_32bit_4 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(4));
		
	U_ROM_SCR5 : entity work.img_rom_32bit_5 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(5));
		
	U_ROM_SCR6 : entity work.img_rom_32bit_6 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(6));
		
	U_ROM_SCR7 : entity work.img_rom_32bit_7 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(7));
		
	U_ROM_SCR8 : entity work.img_rom_32bit_8 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(8));
		
	U_ROM_SCR9 : entity work.img_rom_32bit_9 port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(9));
		
	U_ROM_SCRA : entity work.img_rom_32bit_A port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(10));
		
	U_ROM_SCRB : entity work.img_rom_32bit_B port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(11));
		
	U_ROM_SCRC : entity work.img_rom_32bit_C port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(12));
		
	U_ROM_SCRD : entity work.img_rom_32bit_D port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(13));
		
	U_ROM_SCRE : entity work.img_rom_32bit_E port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(14));
		
	U_ROM_SCRF : entity work.img_rom_32bit_F port map (
		clka => clk,
		addra => score_rom_addr,
		douta => rgb_scores(15));
		
	--main rgb assignment process
	process(clk)
	begin
		red <= (others => '0');
		green <= (others => '0');
		blue <= (others => '0');
		
		if (vid_en = '1') then
			
			--score
			if (Score_en = '1' and PS_en = "01") then
				--display p2 score from rom
				red   <= rgb_scores(to_integer(unsigned(score1)))(11 downto 8);
				green <= rgb_scores(to_integer(unsigned(score1)))(7  downto 4);
				blue  <= rgb_scores(to_integer(unsigned(score1)))(3  downto 0);
			elsif (Score_en = '1' and PS_en = "10") then
				--display p2 score from rom
				red   <= rgb_scores(to_integer(unsigned(score2)))(11 downto 8);
				green <= rgb_scores(to_integer(unsigned(score2)))(7  downto 4);
				blue  <= rgb_scores(to_integer(unsigned(score2)))(3  downto 0);
			end if;
			
			--ball
			if (ball_en = '1') then
				--display ball from rom
				red   <= rgb_ball(11 downto 8);
				green <= rgb_ball(7  downto 4);
				blue  <= rgb_ball(3  downto 0);
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