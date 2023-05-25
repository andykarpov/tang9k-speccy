-------------------------------------------------------------------[14.07.2014]
-- VIDEO Pentagon or Spectrum mode
-------------------------------------------------------------------------------

library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

entity video is
	port (
		CLK		: in std_logic;
		INTA	: in std_logic;
		INT		: out std_logic;
		BORDER	: in std_logic_vector(2 downto 0);
		BORDON	: out std_logic;
		ATTR	: out std_logic_vector(7 downto 0);
		A		: out std_logic_vector(12 downto 0);
		DI		: in std_logic_vector(7 downto 0);
		BLANK	: out std_logic;
		RGB		: out std_logic_vector(5 downto 0);
		HSYNC	: out std_logic;
		VSYNC	: out std_logic;

        HCNT_O  : out std_logic_vector(11 downto 0);
        VCNT_O  : out std_logic_vector(11 downto 0);
    
        INT_POS_H : in std_logic_vector(11 downto 0);
        INT_POS_V : in std_logic_vector(11 downto 0)
);
end entity;

architecture rtl of video is

-- pentagon	48K screen mode
	constant pent_screen_h		: natural := 512;
	constant pent_screen_v		: natural := 384;

    constant pent_border_left   : natural := 104;
    constant pent_border_right   : natural := 104;
    constant pent_border_top   : natural := 96;
    constant pent_border_bottom   : natural := 96;

    -- int position
	constant h_int_on		: natural := 128 + pent_screen_h + 128 - 1;
	constant v_int_on		: natural := 128 + pent_screen_v + 96 - 1;

    -- Horizontal Timing constants  
    constant h_pixels_across	: integer := 720 - 1;
    constant h_sync_on		: integer := 732 - 1;
    constant h_sync_off		: integer := 796 - 1;
    constant h_end_count		: integer := 896 - 1;

    -- Vertical Timing constants
    constant v_pixels_down		: integer := 576 - 1;
    constant v_sync_on		: integer := 581 - 1;
    constant v_sync_off		: integer := 586 - 1;
    constant v_end_count		: integer := 640 - 1;
	
---------------------------------------------------------------------------------------	

	signal h_cnt			: unsigned(11 downto 0) := (others => '0');
	signal v_cnt			: unsigned(11 downto 0) := (others => '0');
	signal paper			: std_logic;
	signal paper1			: std_logic;
	signal flash			: unsigned(4 downto 0) := (others => '0');
	signal vid_reg			: std_logic_vector(7 downto 0);
	signal pixel_reg		: std_logic_vector(7 downto 0);
	signal attr_reg			: std_logic_vector(7 downto 0);
    signal pixel            : std_logic;
	signal h_sync			: std_logic;
	signal v_sync			: std_logic;
	signal int_sig			: std_logic;
	signal blank_sig		: std_logic;

    signal pent_h_cnt       : std_logic_vector(9 downto 0);
    signal pent_v_cnt       : std_logic_vector(9 downto 0);

    signal border1          : std_logic_vector(2 downto 0);

begin

-- h/v counters
process (CLK, h_cnt)
begin
    if CLK'event and CLK = '1' then
        if h_cnt = h_end_count then
            h_cnt <= (others => '0');
        else
            h_cnt <= h_cnt + 1;
        end if;
        if h_cnt = h_sync_on then
            if v_cnt = v_end_count then
                v_cnt <= (others => '0');
            else
                v_cnt <= v_cnt + 1;
            end if;
        end if;

        if (h_cnt = pent_border_left - 16) then 
            pent_h_cnt <= (others => '0');
        else 
            pent_h_cnt <= pent_h_cnt + 1;
        end if;

        if h_cnt = h_sync_on then
            if v_cnt = pent_border_top then 
                pent_v_cnt <= (others => '0');
            else 
                pent_v_cnt <= pent_v_cnt + 1;
            end if;
        end if;
    
    end if;
end process;

-- hsync, vsync, blank
hsync	<= '1' when (h_cnt <= h_sync_on) or (h_cnt > h_sync_off) else '0';
vsync	<= '1' when (v_cnt <= v_sync_on) or (v_cnt > v_sync_off) else '0';
blank	<= '1' when (h_cnt > h_pixels_across) or (v_cnt > v_pixels_down) else '0';

-- flash, int
process (CLK)
begin
	if (CLK'event and CLK = '1') then
--        if h_cnt = h_int_on and v_cnt = v_int_on then
        if h_cnt = to_integer(unsigned(INT_POS_H)) and v_cnt = to_integer(unsigned(INT_POS_V)) then
            flash <= flash + 1;
            int_sig <= '0';
        elsif (INTA = '0') then
            int_sig <= '1';
        end if;
    end if;
end process;

-- video mem read
process (CLK)
begin
	if (CLK'event and CLK = '1') then

			case h_cnt(3 downto 1) is
                when "000" =>
                    pixel <= pixel_reg(6);
                when "001" =>
                    pixel <= pixel_reg(5);
                when "010" =>
                    pixel <= pixel_reg(4);
                when "011" =>
                    pixel <= pixel_reg(3);                
				when "100" => 
                    pixel <= pixel_reg(2);
					A <= std_logic_vector(pent_v_cnt(8 downto 7)) & std_logic_vector(pent_v_cnt(3 downto 1)) & std_logic_vector(pent_v_cnt(6 downto 4)) & std_logic_vector(pent_h_cnt(8 downto 4));
				when "101" =>
                    pixel <= pixel_reg(1);
					vid_reg <= DI;
				when "110" =>
                    pixel <= pixel_reg(0);
					A <= "110" & std_logic_vector(pent_v_cnt(8 downto 4)) & std_logic_vector(pent_h_cnt(8 downto 4));
				when "111" =>
                    pixel <= vid_reg(7);
					pixel_reg <= vid_reg;
					attr_reg <= DI;
                    border1 <= border;
					paper1 <= paper;
				when others => null;
			end case;
	end if;
end process;

-- rgb
RGB <= 	(others => '0') when (blank = '1') else
			attr_reg(4) & (attr_reg(4) and attr_reg(6)) & attr_reg(5) & (attr_reg(5) and attr_reg(6)) & attr_reg(3) & (attr_reg(3) and attr_reg(6)) when paper1 = '1' and (pixel xor (flash(4) and attr_reg(7))) = '0' else
			attr_reg(1) & (attr_reg(1) and attr_reg(6)) & attr_reg(2) & (attr_reg(2) and attr_reg(6)) & attr_reg(0) & (attr_reg(0) and attr_reg(6)) when paper1 = '1' and (pixel xor (flash(4) and attr_reg(7))) = '1' else
			BORDER1(1) & '0' & BORDER1(2) & '0' & BORDER1(0) & '0';
			
paper <= '1' when pent_h_cnt < pent_screen_h and pent_v_cnt < pent_screen_v else '0'; 
INT		<= int_sig;
BORDON	<= paper;	-- #FF
ATTR	<= attr_reg;

HCNT_O <= std_logic_vector(unsigned(h_cnt));
VCNT_O <= std_logic_vector(unsigned(v_cnt));

end architecture;