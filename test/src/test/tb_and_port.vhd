library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library vunit_lib;
context vunit_lib.vunit_context;

entity testbench is
  generic (runner_cfg : string);
end testbench;

architecture arch of testbench is
  component and_port
    port ( a: in std_logic;
           b: in std_logic;
           y: out std_logic);
  end component;

  -- inputs
  signal a : STD_LOGIC := '0';
  signal b : STD_LOGIC := '1';
  signal y : STD_LOGIC;

begin

  uut: and_port port map (
    a => a,
    b => b,
    y => y);

  test_runner: process
  begin
    test_runner_setup(runner, runner_cfg);

    wait for 100 ns;
    assert y = '0' report "error 1";

    wait for 100 ns;
    a <= '1';

    wait for 100 ns;
    assert y = '1' report "error 2";

    test_runner_cleanup(runner); -- Simulation ends here
  end process;

end arch;
