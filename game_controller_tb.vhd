library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity game_controller_tb is
end game_controller_tb;


architecture testbench of game_controller_tb is

    signal rst : std_logic := '0';
    signal clk : std_logic := '0';
    signal in1 : std_logic := '0';
    signal in2 : std_logic := '0';
    signal in3 : std_logic := '0';
    signal in4 : std_logic := '0';
    signal ball_x    : std_logic_vector(9 downto 0);
    signal ball_y    : std_logic_vector(9 downto 0);
    signal left_pad  : std_logic_vector(9 downto 0);
    signal right_pad : std_logic_vector(9 downto 0);
    signal score1    : std_logic_vector(3 downto 0);
    signal score2    : std_logic_vector(3 downto 0);

begin

    U : entity work.game_controller
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
            right_pad => right_pad,
            score1 => score1,
            score2 => score2
        );

    process
    begin

        rst <= '1';
        wait for 10 ns;
        rst <= '0';

        clk <= '1';
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
        in2 <= '1';
        in4 <= '1';
        clk <= '1';
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
        wait;

    end process;


end testbench;