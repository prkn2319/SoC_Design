library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.VGA_LIB.all;

entity block_row_col_ball is
	port (
		Vcount 	 : in std_logic_vector(9 downto 0);
		Hcount	 : in std_logic_vector(9 downto 0);
		ball_x	 : in std_logic_vector(9 downto 0);
		ball_y	 : in std_logic_vector(9 downto 0);
		Rom_Addr 	 : out std_logic_vector(7 downto 0);
		Ball_en 	 : out std_logic);		
end block_row_col_ball;

architecture BHV of block_row_col_ball is

	signal ball_x_en, ball_y_en : std_logic;

begin

	Ball_en <= ball_x_en and ball_y_en;
	
	process(Vcount)
		
		variable temp : unsigned(9 downto 0);
	
		begin
			-- draw center
			if (unsigned(Vcount) >= unsigned(ball_y) AND unsigned(Vcount) <= unsigned(ball_y)+15) then
				temp := (unsigned(Vcount) - unsigned(ball_y));
				ball_y_en <='1';
			else 
				temp := (others => '0');
				ball_y_en <='0';
			end if;
		
		Rom_Addr(7 downto 4) <= std_logic_vector(temp(3 downto 0));
	end process;
	
	process(Hcount)
		
		variable temp : unsigned(9 downto 0);
	
		begin
			-- draw center
			if (unsigned(Hcount) >= unsigned(ball_x) AND unsigned(Hcount) <= unsigned(ball_x)+15) then
				temp := (unsigned(Hcount) - unsigned(ball_x));
				ball_x_en <='1';
			else 
				temp := (others => '0');
				ball_x_en <='0';
			end if;
		
		Rom_Addr(3 downto 0) <= std_logic_vector(temp(3 downto 0));
	end process;
	
end BHV;