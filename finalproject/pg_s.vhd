library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pg_s is
port (CLK,SW,P:IN STD_LOGIC;--SW PIN 55 prestatement P is pause
	 Z:OUT STD_LOGIC;--Z PIN 33	
	  N:OUT STD_LOGIC;--N next statement
	  R0,G0:IN STD_LOGIC;--light input
	  R,G:OUT STD_LOGIC;--light output
	 Y:OUT STD_LOGIC_VECTOR(6 downto 0)--ten,bit
   );
end pg_s;

architecture a of pg_s is
SIGNAL QN : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL op :STD_LOGIC_VECTOR(6 downto 0);
SIGNAL n1 :STD_LOGIC;
BEGIN

	Z<=SW;
	PROCESS (CLK,P) --down                   
	BEGIN	
	n1<='0';
	if P='0'then
	 R<=R0;
	 G<=G0;	
	elsif P='1' then
	 R<='1';
	 G<='1';

		IF CLK'event AND CLK='1' THEN
 			QN <= QN-1;
        end if;
		if QN="0001" then
			n1<='1';	                                                       
		END IF;
END IF;

IF SW='1'THEN		
				case QN is
					when "0000"=> op<="1111110";--0 bit
					when "0001"=> op<="0110000";  --1
					when "0010"=> op<="1101101" ;--2
					when "0011"=> op<= "1111001";--3
					when "0100"=> op<= "0110011";--4
					when "0101"=> op<="1011011";--5
					when "0110"=> op<= "1011111";--6
					when "0111"=> op<= "1110000";--7
					when "1000"=> op<= "1111111";--8
					when "1001"=> op<="1111011" ;--9
					when "1010"=> op<= "1111110";--10
					when "1011"=> op<="0110000";--11
					when "1100"=> op<= "1101101";--12
					when "1101"=> op<= "1111001";--13
					when "1110"=> op<= "0110011";--14
					when "1111"=> op<= "1011011";--15
				end case;
		ELSIF SW='0' THEN		
			case QN is
					when "0000"=> op<= "1111110";--0 ten
					when "0001"=> op<="1111110";--1
					when "0010"=> op<= "1111110" ;--2
					when "0011"=> op<="1111110";--3
					when "0100"=> op<="1111110";--4
					when "0101"=> op<= "1111110";--5
					when "0110"=> op<= "1111110";--6
					when "0111"=> op<="1111110";--7
					when "1000"=> op<="1111110";--8
					when "1001"=> op<= "1111110" ;--9
					when "1010"=> op<= "0110000";--10
					when "1011"=> op<= "0110000";--11
					when "1100"=> op<="0110000" ;--12
					when "1101"=> op<= "0110000" ;--13
					when "1110"=> op<= "0110000";--14
					when "1111"=> op<=  "0110000";--15
			end case;
	END IF;
		Y<=op;
		--end if;
	end process;
	N<=n1;
end a;

