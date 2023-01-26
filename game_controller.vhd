library ieee;
use ieee.std_logic_1164.all;

--x 640p
--y 480p

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
        right_pad : out std_logic_vector(WIDTH-1 downto 0);
        RGB       : out std_logic_vector(23 downto 0)
    );
end game_controller;


architecture arch of game_controller is 

    signal direction_right : std_logic;

begin

    process (rst, clock)
    begin 

        if (rst = '1') then

            ball_x <= (others => '0');
            ball_y <= (others => '0');
            left_pad <= (others => '0');
            right_pad <= (others => '0');
        
        elsif (rising_edge(clk)) then
            
            if (direction_right = '0' AND to_integer(unsigned(ball_x)) <= 20) then
                if (ball_y = left_pad) then
                    --ball contacts
                else
                    --ball misses
                end if;
            elsif (direction_right = '1' AND to_integer(unsigned(ball_x)) >= 620) then
                if (ball_y = right_pad) then
                    --ball contacts
                else
                    --ball misses
                end if;
            elsif (ball_y = 0) then
                -- ball hits ceiling
            elsif (ball_y = 480) then
                -- ball hits floor
            end if;

        end if;
    end process;

end arch;