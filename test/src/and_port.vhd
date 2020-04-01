library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_port is
  Port ( a: in STD_LOGIC;
         b: in STD_LOGIC;
         y: out STD_LOGIC);
end and_port;

architecture arch of and_port is
begin
  y <= a and b;
end arch;
