library ieee;
use ieee.std_logic_1164.all;

--x 640p
--y 480p
--paddles 50 pixels long, 5 10 pixel strike segments
--ball constant x velocity of 10 pixels

entity game_controller is 
    generic (WIDTH : positive := 16);
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
        right_pad : out std_logic_vector(WIDTH-1 downto 0)
        --RGB       : out std_logic_vector(23 downto 0)
    );
end game_controller;


architecture arch of game_controller is 

    signal game_reset : std_logic;
    signal direction_right : std_logic;
    signal ball_xpos : unsigned(WIDTH-1 downto 0);
    signal ball_ypos : unsigned(WIDTH-1 downto 0);
    signal ball_yvect : signed(WIDTH-1 downto 0);
    signal left_pad_pos : unsigned(WIDTH-1 downto 0);
    signal right_pad_pos : unsigned(WIDTH-1 downto 0);

begin

    process (rst, clock)
    begin 

        if (rst = '1' OR game_reset <= '1') then
            
            game_reset <= '0';
            ball_xpos <= (others => '0');
            ball_ypos <= (others => '0');
            ball_yvect <= (others => '0');
            left_pad_pos <= (others => '0');
            right_pad_pos <= (others => '0');
            ball_x <= (others => '0');
            ball_y <= (others => '0');
            left_pad <= (others => '0');
            right_pad <= (others => '0');
        
        elsif (rising_edge(clk)) then
            
            -- PADDLE LOGIC
            if (in1 = '1' AND to_integer(left_pad_pos) >= 10) then
                left_pad_pos = left_pad_pos - 10;
            end if;
            if (in2 = '1' AND to_integer(left_pad_pos) <= 420) then
                left_pad_pos = left_pad_pos + 10;
            end if;
            if (in3 = '1' AND to_integer(right_pad_pos) >= 10) then
                right_pad_pos = right_pad_pos - 10;
            end if;
            if (in4 = '1' AND to_integer(right_pad_pos) <= 420) then
                right_pad_pos = right_pad_pos + 10;
            end if;
            
            -- GAME LOGIC
            if (direction_right = '0' AND to_integer(ball_xpos) = 20) then
                --ball contacts
                direction_right <= '1';
                if (ball_ypos >= left_pad_pos AND ball_ypos < left_pad_pos + 10) then
                    ball_yvect <= -10;
                elsif (ball_ypos >= left_pad_pos + 10 AND ball_ypos < left_pad_pos + 20) then
                    ball_yvect <= -5;
                elsif (ball_ypos >= left_pad_pos + 20 AND ball_ypos < left_pad_pos + 30) then
                    ball_yvect <= 0;
                elsif (ball_ypos >= left_pad_pos + 30 AND ball_ypos < left_pad_pos + 40) then
                    ball_yvect <= 5;
                elsif (ball_ypos >= left_pad_pos + 40 AND ball_ypos < left_pad_pos + 50) then
                    ball_yvect <= 10;
                --ball misses
                else
                    direction_right <= '0'
                end if;
            elsif (direction_right = '1' AND to_integer(ball_xpos) = 620) then
                --ball contacts
                direction_right <= '0'
                if (ball_ypos >= right_pad_pos AND ball_ypos < right_pad_pos + 10) then
                    ball_yvect <= -10;
                elsif (ball_ypos >= right_pad_pos + 10 AND ball_ypos < right_pad_pos + 20) then
                    ball_yvect <= -5;
                elsif (ball_ypos >= right_pad_pos + 20 AND ball_ypos < right_pad_pos + 30) then
                    ball_yvect <= 0;
                elsif (ball_ypos >= right_pad_pos + 30 AND ball_ypos < right_pad_pos + 40) then
                    ball_yvect <= 5;
                elsif (ball_ypos >= right_pad_pos + 40 AND ball_ypos < right_pad_pos + 50) then
                    ball_yvect <= 10;
                --ball misses
                else
                    direction_right <= '1';
                end if;
            -- ball hits ceiling or floor
            elsif (ball_ypos = 0 OR ball_ypos = 480) then
                ball_yvect <= -ball_yvect;
            -- ball hits side, game resets
            elseif (ball_xpos = 0 OR ball_xpos = 640) then
                game_reset <= '1';
            end if;

            -- ASSIGN OUTPUT (may need to make outputs combinational to avoid clock cycle delay)
            if (directon_right = '0') then
                ball_xpos <= ball_xpos - 10;
                ball_x <= ball_xpos - 10;
            else
                ball_xpos <= ball_xpos + 10;
                ball_x <= ball_xpos + 10;
            end if;
            ball_ypos = ball_ypos + ball_yvect;
            ball_y = ball_ypos + ball_yvect;
            left_pad = left_pad_pos;
            right_pad = right_pad_pos;


        end if;
    end process;

end arch;