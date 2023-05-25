-------------------------------------------------------------------------------------------------------------------
-- Debug module
-------------------------------------------------------------------------------------------------------------------

library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all; 

entity debug is
port (
    CLK          : in std_logic;
    RESET        : in std_logic;

    REG1         : in std_logic_vector(15 downto 0);
    REG2         : in std_logic_vector(15 downto 0);

    OSD_COMMAND  : out std_logic_vector(15 downto 0)
);
end debug;

architecture rtl of debug is

type tosdmachine is (idle, set_x, set_y, set_char, set_attr, finish);
signal osdstate: tosdmachine := finish;

type ttestmachine is (idle, copy_mem, read_byte, read_byte2, print_addr, print_byte, print_byte2, print_space, print_hex, print_hex2, print_char, finish);
signal teststate: ttestmachine := finish;
signal returnstate : ttestmachine := finish;
signal prev_returnstate : ttestmachine := finish;

signal char_x, char_y, char, attr: std_logic_vector(7 downto 0);
signal cnt_x : std_logic_vector(3 downto 0) := "0000";
signal cnt_read : std_logic_vector(3 downto 0) := "0000";
signal printable : std_logic_vector(7 downto 0) := (others => '0');

begin

-- test 
process (reset, clk)
begin 
	if reset = '1' then 
		teststate <= idle;
		osdstate <= finish;
		cnt_x <= (others => '0');
        cnt_read <= (others => '0');
        osd_command <= (others => '0');
        char <= x"20";
	elsif rising_edge(clk) then 
			case (teststate) is

				when idle =>
                    osdstate <= idle;
                    teststate <= print_addr;

				when print_addr =>
                    osdstate <= idle;
                    returnstate <= print_space;
                    teststate <= print_hex;
                    printable <= "0000" & cnt_read(3 downto 0);
					
				when print_space => 
                    osdstate <= idle;
                    returnstate <= print_byte;
                    teststate <= print_char;
                    char <= x"20"; --space

				when print_byte =>
						osdstate <= idle;
						returnstate <= print_byte2;
						teststate <= print_hex;
                        if (cnt_read = "0000") then 
                            printable <= reg1(15 downto 8);
                        else 
                            printable <= reg2(15 downto 8);
                        end if;
					
				when print_byte2 =>
						osdstate <= idle;
						returnstate <= finish;
						teststate <= print_hex;
                        if (cnt_read = "0000") then 
                            printable <= reg1(7 downto 0);
                        else 
                            printable <= reg2(7 downto 0);
                        end if;
				
				-- print hex
				when print_hex =>
						osdstate <= idle;
						teststate <= print_char;
						prev_returnstate <= returnstate;
						returnstate <= print_hex2;
						if (printable(7 downto 4) > 9) then
							char <= x"37" + printable(7 downto 4);
						else
							char <= x"30" + printable(7 downto 4); 
						end if;
					
				when print_hex2 =>
						osdstate <= idle;
						teststate <= print_char;
						returnstate <= prev_returnstate;
						if (printable(3 downto 0) > 9) then
							char <= x"37" + printable(3 downto 0);
						else
							char <= x"30" + printable(3 downto 0); 
						end if;
				
				-- print char on the screen and return back to the returnstate
				when print_char =>
						case (osdstate) is 
							when idle => 
								char_x <= "0000" & cnt_x;
								char_y <= "0000" & cnt_read;
								--attr <= "11110000";
                                attr <= "10010000"; -- red on black
								cnt_x <= cnt_x + 1;
								osdstate <= set_x;					
							when set_x => osd_command <= x"10" & char_x; osdstate <= set_y;
							when set_y => osd_command <= x"11" & char_y; osdstate <= set_char;
							when set_char => osd_command <= x"12" & char; osdstate <= set_attr;
							when set_attr => osd_command <= x"13" & attr; osdstate <= finish;
							when finish => teststate <= returnstate; osd_command <= x"FFFF"; char <= x"20";							
						end case;					
				
				when finish => 
                    cnt_x <= (others => '0');
					teststate <= idle;
					if (cnt_read < "0001") then 
						cnt_read <= cnt_read + 1;
					else 
						cnt_read <= (others => '0');
					end if;
			end case;
		--end if;
	end if;
end process;

end rtl;
