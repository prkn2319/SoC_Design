library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--x 640p
--y 480p
--paddles 50 pixels long, 5 10 pixel strike segments
--ball constant x velocity of 10 pixels

entity game_controller_test is 
    generic (WIDTH : positive := 10);
    port (
        rst : in std_logic;
        clk : in std_logic;
        in1 : in std_logic;
        in2 : in std_logic;
        in3 : in std_logic;
        in4 : in std_logic;
        ball_x    : out std_logic_vector(WIDTH-1 downto 0);
        ball_y    : out std_logic_vector(WIDTH-1 downto 0);
        left_pad  : out std_logic_vector(WIDTH-1 downto 0);
        right_pad : out std_logic_vector(WIDTH-1 downto 0);
        score1 : out std_logic_vector(3 downto 0);
        score2 : out std_logic_vector(3 downto 0)
    );
end game_controller_test;


architecture arch of game_controller_test is 

    signal game_reset : std_logic;
    signal direction_right : std_logic;
	signal direction_down  : std_logic;
    signal ball_xpos : unsigned(WIDTH-1 downto 0);
    signal ball_ypos : unsigned(WIDTH-1 downto 0);
    signal ball_yvect : signed(WIDTH-1 downto 0);
    signal left_pad_pos : unsigned(WIDTH-1 downto 0);
    signal right_pad_pos : unsigned(WIDTH-1 downto 0);
    signal score1_sig : unsigned(3 downto 0);
    signal score2_sig : unsigned(3 downto 0);

begin

    process (rst, game_reset, clk)
    begin 

        if (rst = '1') then
            
            game_reset <= '0';
            direction_right <= '0';
			direction_down  <= '0';
            ball_xpos <= "0101000000";
            ball_ypos <= "0011110000";
            ball_yvect <= (others => '0');
            left_pad_pos  <= "0011011100";
            right_pad_pos <= "0011011100";
            score1_sig <= x"0";
            score2_sig <= x"0";
			
		elsif (game_reset = '1') then
			
			game_reset <= '0';
            --direction_right <= '0';
            ball_xpos <= "0101000000";
            ball_ypos <= "0011110000";
            ball_yvect <= (others => '0');
            --left_pad_pos  <= "0000001010";
            --right_pad_pos <= "0000001010";
            --score1_sig <= x"0";
            --score2_sig <= x"0";
        
        elsif (rising_edge(clk)) then
            
            -- PADDLE LOGIC
            if (in1 = '1' AND (left_pad_pos) >= 10) then
                left_pad_pos <= left_pad_pos - 8;
            end if;
            if (in2 = '1' AND (left_pad_pos) <= 420) then
                left_pad_pos <= left_pad_pos + 8;
            end if;
            if (in3 = '1' AND (right_pad_pos) >= 10) then
                right_pad_pos <= right_pad_pos - 8;
            end if;
            if (in4 = '1' AND (right_pad_pos) <= 420) then
                right_pad_pos <= right_pad_pos + 8;
            end if;
            
            -- GAME LOGIC
            if (direction_right = '0' AND (ball_xpos) <= 12) then
                --ball contacts
                direction_right <= '1';
                if (ball_ypos >= left_pad_pos-5 AND ball_ypos < left_pad_pos + 6) then
                    ball_yvect <= to_signed(-8, WIDTH);
                elsif (ball_ypos >= left_pad_pos + 6 AND ball_ypos < left_pad_pos + 17) then
                    ball_yvect <= to_signed(-4, WIDTH);
                elsif (ball_ypos >= left_pad_pos + 17 AND ball_ypos < left_pad_pos + 28) then
                    ball_yvect <= to_signed(0, WIDTH);
                elsif (ball_ypos >= left_pad_pos + 28 AND ball_ypos < left_pad_pos + 39) then
                    ball_yvect <= to_signed(4, WIDTH);
                elsif (ball_ypos >= left_pad_pos + 40 AND ball_ypos < left_pad_pos + 50) then
                    ball_yvect <= to_signed(8, WIDTH);
                --ball misses
                else
					score2_sig <= score2_sig + 1;
					game_reset <= '1';
                end if;
            elsif (direction_right = '1' AND (ball_xpos) >= 620) then
                --ball contacts
                direction_right <= '0';
                if (ball_ypos >= right_pad_pos-5 AND ball_ypos < right_pad_pos + 6) then
                    ball_yvect <= to_signed(-8, WIDTH);
                elsif (ball_ypos >= right_pad_pos + 6 AND ball_ypos < right_pad_pos + 17) then
                    ball_yvect <= to_signed(-4, WIDTH);
                elsif (ball_ypos >= right_pad_pos + 17 AND ball_ypos < right_pad_pos + 28) then
                    ball_yvect <= to_signed(0, WIDTH);
                elsif (ball_ypos >= right_pad_pos + 28 AND ball_ypos < right_pad_pos + 39) then
                    ball_yvect <= to_signed(4, WIDTH);
                elsif (ball_ypos >= right_pad_pos + 39 AND ball_ypos < right_pad_pos + 50) then
                    ball_yvect <= to_signed(8, WIDTH);
                --ball misses
                else
					score1_sig <= score1_sig + 1;
					game_reset <= '1';
                end if;
            -- ball hits ceiling or floor
            elsif (ball_ypos <= 10 and ball_yvect < 0) then
                ball_yvect <= -ball_yvect;
            elsif (ball_ypos >= 464 and ball_yvect > 0) then
                ball_yvect <= -ball_yvect;
            -- ball hits side, game resets
--            elsif (ball_xpos <= 10) then
--                
--                score1_sig <= score1_sig + 1;
--                direction_right <= '0';
--				game_reset <= '1';
--            elsif (ball_xpos >= 629) then
                
--                score2_sig <= score2_sig + 1;
--                direction_right <= '1';
--				game_reset <= '1';
            end if;

            --CALCULATE X and Y
            if (direction_right = '0') then
                ball_xpos <= ball_xpos - 8;
            else
                ball_xpos <= ball_xpos + 8;
            end if;
            ball_ypos <= unsigned(signed(ball_ypos) + ball_yvect);


        end if;
    end process;
	

       -- ASSIGN OUTPUT (may need to make outputs combinational to avoid clock cycle delay)
        ball_x <= std_logic_vector(ball_xpos);
        ball_y <= std_logic_vector(ball_ypos);
        left_pad <= std_logic_vector(left_pad_pos);
        right_pad <= std_logic_vector(right_pad_pos);
        score1 <= std_logic_vector(score1_sig);
        score2 <= std_logic_vector(score2_sig);


end arch;