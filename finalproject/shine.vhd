library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity shine is
port( clk : IN STD_LOGIC;
	  R : OUT STD_LOGIC;
	  G : OUT STD_LOGIC);
	
end shine;

architecture a of shine is
SIGNAL Y,Z :STD_LOGIC;
begin
	process(clk,Y,Z) 
		BEGIN
	   if clk='1'then
        Y<='1';
		Z<='1';
           elsif clk='0' then
	        Y<='0';
		Z<='0';
	   end if;	
	R<=Y;
	G<=Z;
 	end process;
	
end a;