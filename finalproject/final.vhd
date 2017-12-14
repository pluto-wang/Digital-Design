library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_UNSIGNED.all;

entity final is
port(clk,flag,cgin,prin,sw: in std_logic;
	cy,cr,pg,cg,pr,finish: out std_logic;
	seven:OUT STD_LOGIC_VECTOR(6 downto 0);
	Z:OUT STD_LOGIC);
end final;

architecture a of final is
signal qn:std_logic_vector(3 downto 0);
SIGNAL cred,cyel,pgre,sign,cg1,pr1 :STD_LOGIC;
SIGNAL op :STD_LOGIC_VECTOR(6 downto 0);
begin
	process(clk,cyel,cred,pgre,flag,sign)
	begin

	if(flag='1') then
		cg1<='0';
		pr1<='0';
		if clk'event AND clk='1' then
			qn <= qn-1;
		end if;
		if (qn="0000") then
			cyel <= '1';
			cred <= '0'; 
			pgre <= '0';
		else 
			cyel <= '0';
			cred <= '1';
			
			if(clk='1') then
				pgre <= '1';
			elsif(clk='0') then
				pgre<='0';		
			end if;
		end if;
		Z<=SW;
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
	else
		qn<="0000";
		op<="0000000";
		cyel<='0';
		cred<='0';
		pgre<='0';
		cg1<=cgin;
		pr1<=prin;
	end if;
	
		
	end process;
	cy<=cyel;
	cr<=cred;
	pg<=pgre;
	cg<=cg1;
	pr<=pr1;
	seven<=op;

end a;	