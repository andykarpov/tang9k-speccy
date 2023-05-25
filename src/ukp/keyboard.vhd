library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity keyboard is
port (
    CLK : in std_logic;
    CLK_USB : in std_logic;
    RESET : in std_logic;

    USB_DP : inout std_logic;
    USB_DN : inout std_logic;

    A : in std_logic_vector(15 downto 8);
    DO : out std_logic_vector(4 downto 0);

    FN : out std_logic_vector(1 to 12) := (others => '0')
);

end keyboard;

architecture rtl of keyboard is

signal key0 : std_logic_vector(7 downto 0);
signal key1 : std_logic_vector(7 downto 0);
signal key2 : std_logic_vector(7 downto 0);
signal key3 : std_logic_vector(7 downto 0);
signal key4 : std_logic_vector(7 downto 0);
signal key5 : std_logic_vector(7 downto 0);
signal key6 : std_logic_vector(7 downto 0);
signal data : std_logic_vector(47 downto 0);
signal new_packet : std_logic := '0';
signal new_packet_r : std_logic_vector(1 downto 0);
signal prev_new_packet : std_logic := '0';
signal conerr : std_logic := '0';

type key_matrix is array (11 downto 0) of std_logic_vector(4 downto 0);
signal keys		: key_matrix;
signal row0, row1, row2, row3, row4, row5, row6, row7 : std_logic_vector(4 downto 0);
	
begin

U_UKP: entity work.ukp2key
port map (
    usbclk => CLK_USB,
    usbrst_n => not RESET,

    usb_dm => USB_DN,
    usb_dp => USB_DP,

    key0 => key0,
    key1 => key1,
    key2 => key2,
    key3 => key3,
    key4 => key4,
    key5 => key5,
    key6 => key6,
    new_packet => new_packet,
    conerr => conerr
);

process (CLK, new_packet)
begin 
    if rising_edge(CLK) then 
        new_packet_r(0) <= new_packet;
        new_packet_r(1) <= new_packet_r(0);
    end if;
end process;

data <= key1 & key2 & key3 & key4 & key5 & key6;

-- Output addressed row to ULA
row0 <= keys(0) when A(8) = '0' else (others => '1');
row1 <= keys(1) when A(9) = '0' else (others => '1');
row2 <= keys(2) when A(10) = '0' else (others => '1');
row3 <= keys(3) when A(11) = '0' else (others => '1');
row4 <= keys(4) when A(12) = '0' else (others => '1');
row5 <= keys(5) when A(13) = '0' else (others => '1');
row6 <= keys(6) when A(14) = '0' else (others => '1');
row7 <= keys(7) when A(15) = '0' else (others => '1');
DO <= row0 and row1 and row2 and row3 and row4 and row5 and row6 and row7;

process (CLK, RESET, new_packet_r, prev_new_packet, key0, key1, key2, key3, key4, key5, key6, A)
begin 
    if RESET = '1' then 
        keys(0) <= (others => '1');
        keys(1) <= (others => '1');
        keys(2) <= (others => '1');
        keys(3) <= (others => '1');
        keys(4) <= (others => '1');
        keys(5) <= (others => '1');
        keys(6) <= (others => '1');
        keys(7) <= (others => '1');
        keys(8) <= (others => '0');
        keys(9) <= (others => '0');
        keys(10) <= (others => '0');
        keys(11) <= (others => '0');
        FN <= (others => '0');
    elsif rising_edge(CLK) then 
        if (prev_new_packet /= new_packet_r(1)) then 
            prev_new_packet <= new_packet_r(1);

            -- reset out data
            keys(0) <= (others => '1');
            keys(1) <= (others => '1');
            keys(2) <= (others => '1');
            keys(3) <= (others => '1');
            keys(4) <= (others => '1');
            keys(5) <= (others => '1');
            keys(6) <= (others => '1');
            keys(7) <= (others => '1');
            keys(8) <= (others => '0');
            keys(9) <= (others => '0');
            keys(10) <= (others => '0');
            keys(11) <= (others => '0');
            FN <= (others => '0');

            -- modifiers
--			if key0(0) = '1' then keys(11)(3) <= '1'; end if;	-- E0 Left Control
            if key0(1) = '1' then keys(0)(0) <= '0'; end if;	-- E1 Left shift (CAPS SHIFT)
--			if key0(2) = '1' then rx_buffer <= X"E2"; end if;	-- E2 Left Alt
            if key0(3) = '1' then keys(11)(3) <= '1'; end if;	-- E3 Left Gui
            if key0(4) = '1' then keys(7)(1) <= '0'; end if;	-- E4 CTRL (Symbol Shift)
            if key0(5) = '1' then keys(0)(0) <= '0'; end if;	-- E5 Right shift (CAPS SHIFT)
--			if key0(6) = '1' then keys(11)(3) <= '1'; end if;	-- E6 Right Alt
--  		if key0(7) = '1' then keys(11)(3) <= '1'; end if;	-- E7 Right Gui

            -- key1 - key6
            for II in 0 to 5 loop
                case data((II+1)*8-1 downto II*8) is
                    when X"1d" =>	keys(0)(1) <= '0'; -- Z
                    when X"1b" =>	keys(0)(2) <= '0'; -- X
                    when X"06" =>	keys(0)(3) <= '0'; -- C
                    when X"19" =>	keys(0)(4) <= '0'; -- V

                    when X"04" =>	keys(1)(0) <= '0'; -- A
                    when X"16" =>	keys(1)(1) <= '0'; -- S
                    when X"07" =>	keys(1)(2) <= '0'; -- D
                    when X"09" =>	keys(1)(3) <= '0'; -- F
                    when X"0a" =>	keys(1)(4) <= '0'; -- G

                    when X"14" =>	keys(2)(0) <= '0'; -- Q
                    when X"1a" =>	keys(2)(1) <= '0'; -- W
                    when X"08" =>	keys(2)(2) <= '0'; -- E
                    when X"15" =>	keys(2)(3) <= '0'; -- R
                    when X"17" =>	keys(2)(4) <= '0'; -- T

                    when X"1e" =>	keys(3)(0) <= '0'; -- 1
                    when X"1f" =>	keys(3)(1) <= '0'; -- 2
                    when X"20" =>	keys(3)(2) <= '0'; -- 3
                    when X"21" =>	keys(3)(3) <= '0'; -- 4
                    when X"22" =>	keys(3)(4) <= '0'; -- 5

                    when X"27" =>	keys(4)(0) <= '0'; -- 0
                    when X"26" =>	keys(4)(1) <= '0'; -- 9
                    when X"25" =>	keys(4)(2) <= '0'; -- 8
                    when X"24" =>	keys(4)(3) <= '0'; -- 7
                    when X"23" =>	keys(4)(4) <= '0'; -- 6

                    when X"13" =>	keys(5)(0) <= '0'; -- P
                    when X"12" =>	keys(5)(1) <= '0'; -- O
                    when X"0c" =>	keys(5)(2) <= '0'; -- I
                    when X"18" =>	keys(5)(3) <= '0'; -- U
                    when X"1c" =>	keys(5)(4) <= '0'; -- Y

                    when X"28" =>	keys(6)(0) <= '0'; -- ENTER
                    when X"0f" =>	keys(6)(1) <= '0'; -- L
                    when X"0e" =>	keys(6)(2) <= '0'; -- K
                    when X"0d" =>	keys(6)(3) <= '0'; -- J
                    when X"0b" =>	keys(6)(4) <= '0'; -- H

                    when X"2c" =>	keys(7)(0) <= '0'; -- SPACE
                    when X"10" =>	keys(7)(2) <= '0'; -- M
                    when X"11" =>	keys(7)(3) <= '0'; -- N
                    when X"05" =>	keys(7)(4) <= '0'; -- B

                    -- Cursor keys
                    when X"50" =>	keys(0)(0) <= '0'; -- Left (CAPS 5)
                            keys(3)(4) <= '0';
                    when X"51" =>	keys(0)(0) <= '0'; -- Down (CAPS 6)
                            keys(4)(4) <= '0';
                    when X"52" =>	keys(0)(0) <= '0'; -- Up (CAPS 7)
                            keys(4)(3) <= '0';
                    when X"4f" =>	keys(0)(0) <= '0'; -- Right (CAPS 8)
                            keys(4)(2) <= '0';

                    -- Other special keys sent to the ULA as key combinations
                    when X"2a" =>	keys(0)(0) <= '0'; -- Backspace (CAPS 0)
                            keys(4)(0) <= '0';
                    when X"39" =>	keys(0)(0) <= '0'; -- Caps lock (CAPS 2)
                            keys(3)(1) <= '0';
                    when X"2b" =>	keys(0)(0) <= '0'; -- Tab (CAPS SPACE)
                            keys(7)(0) <= '0';
                    when X"37" =>	keys(7)(2) <= '0'; -- .
                            keys(7)(1) <= '0';
                    when X"2d" =>	keys(6)(3) <= '0'; -- -
                            keys(7)(1) <= '0';
                    when X"35" =>	keys(3)(0) <= '0'; -- ` (EDIT)
                            keys(0)(0) <= '0';
                    when X"36" =>	keys(7)(3) <= '0'; -- ,
                            keys(7)(1) <= '0';
                    when X"33" =>	keys(5)(1) <= '0'; -- ;
                            keys(7)(1) <= '0';
                    when X"34" =>	keys(5)(0) <= '0'; -- "
                            keys(7)(1) <= '0';
                    when X"31" =>	keys(0)(1) <= '0'; -- :
                            keys(7)(1) <= '0';
                    when X"2e" =>	keys(6)(1) <= '0'; -- =
                            keys(7)(1) <= '0';
                    when X"2f" =>	keys(4)(2) <= '0'; -- (
                            keys(7)(1) <= '0';
                    when X"30" =>	keys(4)(1) <= '0'; -- )
                            keys(7)(1) <= '0';
                    when X"38" =>	keys(0)(3) <= '0'; -- ?
                            keys(7)(1) <= '0';
                            
                    -- Kempston keys
                    when X"5e" =>	keys(8)(0) <= '1'; -- [6] (Right)
                    when X"5c" =>	keys(8)(1) <= '1'; -- [4] (Left)
                    when X"5a" =>	keys(8)(2) <= '1'; -- [2] (Down)
                    when X"60" =>	keys(8)(3) <= '1'; -- [8] (Up)
                    when X"62" =>	keys(8)(4) <= '1'; -- [0] (Fire)

                    -- Fx keys
                    when X"3a" =>	keys(9)(0) <= '1'; FN(1) <= '1'; -- F1
                    when X"3b" =>	keys(9)(1) <= '1'; FN(2) <= '1'; -- F2
                    when X"3c" =>	keys(9)(2) <= '1'; FN(3) <= '1'; -- F3
                    when X"3d" =>	keys(9)(3) <= '1'; FN(4) <= '1'; -- F4
                    when X"3e" =>	keys(9)(4) <= '1'; FN(5) <= '1'; -- F5
                    when X"3f" =>	keys(10)(0) <= '1'; FN(6) <= '1'; -- F6
                    when X"40" =>	keys(10)(1) <= '1'; FN(7) <= '1'; -- F7
                    when X"41" =>	keys(10)(2) <= '1'; FN(8) <= '1'; -- F8
                    when X"42" =>	keys(10)(3) <= '1'; FN(9) <= '1'; -- F9
                    when X"43" =>	keys(10)(4) <= '1'; FN(10) <= '1'; -- F10
                    when X"44" =>	keys(11)(0) <= '1'; FN(11) <= '1'; -- F11
                    when X"45" =>	keys(11)(1) <= '1'; FN(12) <= '1'; -- F12
     
                    -- Soft keys
                    when X"46" =>	keys(11)(2) <= '1'; -- PrtScr
                    when X"48" =>	keys(11)(4) <= '1'; -- Pause
                    
                    when others => null;
                end case;            
            end loop;
        end if;
    end if;
end process;

end rtl;
