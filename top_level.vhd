library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity top_level is
    generic (WIDTH : positive := 10);
    port (
        rst : in std_logic;
        clk : in std_logic;
        in1 : in std_logic;
        in2 : in std_logic;
        in3 : in std_logic;
        in4 : in std_logic;
        h_sync : out std_logic;
        v_sync : out std_logic;
        red, green, blue : out std_logic_vector(3 downto 0)
    );
end top_level;


architecture arch of top_level is

    signal pixel_clk : std_logic;
    signal disp_en : std_logic;
    signal ball_x : std_logic_vector(WIDTH-1 downto 0);
    signal ball_y : std_logic_vector(WIDTH-1 downto 0);
    signal left_pad : std_logic_vector(WIDTH-1 downto 0);
    signal right_pad : std_logic_vector(WIDTH-1 downto 0);
    signal h_count : std_logic_vector(WIDTH-1 downto 0);
    signal v_count : std_logic_vector(WIDTH-1 downto 0);
    signal score1 : integer;
    signal score2 : integer;

begin

    U_PLL : entity work.PLL
        generic map (
            clk_in_freq  => 50000000,
            clk_out_freq => 25000000)
        port map (
            clk_in => clk,
            clk_out => pixel_clk,
            rst => rst
        );
        
    U_VGA_CONTROLLER : entity work.vga_controller 
        port map (
            rst => rst,
            clk => pixel_clk,
            h_count => h_count,
            v_count => v_count,
            h_sync => h_sync,
            v_sync => v_sync,
            video_on => disp_en
        );

    U_GAME_CONTROLLER : entity work.game_controller
        generic map (WIDTH => 10)
        port map (
            rst => rst,
            clk => clk,
            in1 => in1,
            in2 => in2,
            in3 => in3,  
            in4 => in4,
            ball_x => ball_x,
            ball_y => ball_y,
            left_pad => left_pad,
            right_pad => right_pad
        );

    U_IMAGE_GENERATOR : entity work.image_generator
        generic map (WIDTH => 10)
        port map (
            clk => clk,
            h_count => h_count,
            v_count => v_count,
            vid_en => disp_en,
            ball_x => ball_x,
            ball_y => ball_y,
            left_pad => left_pad,
            right_pad => right_pad,
            score1 => score1,
            score2 => score2,
            red => red,
            green => green,
            blue => blue
        );

end arch;