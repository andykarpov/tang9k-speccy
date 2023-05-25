library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

entity overlay is
	port (
		CLK		: in std_logic;
        RESET   : in std_logic;
        RGB_I   : in std_logic_vector(5 downto 0);
		RGB_O 	: out std_logic_vector(5 downto 0);
		HCNT_I	: in std_logic_vector(11 downto 0);
		VCNT_I	: in std_logic_vector(11 downto 0);
		OSD_COMMAND 	: in std_logic_vector(15 downto 0)
	);
end entity;

architecture rtl of overlay is

    signal video_on : std_logic;
	signal rgb: std_logic_vector(5 downto 0);

    signal attr, attr2: std_logic_vector(7 downto 0);

    signal char_x: std_logic_vector(2 downto 0);
    signal char_y: std_logic_vector(2 downto 0);

    signal rom_addr: std_logic_vector(10 downto 0);
    signal row_addr: std_logic_vector(2 downto 0);
    signal bit_addr: std_logic_vector(2 downto 0);
    signal font_word: std_logic_vector(7 downto 0);
    signal font_reg : std_logic_vector(7 downto 0);	 
    signal pixel: std_logic;
	 signal pixel_reg: std_logic;
    
    signal addr_read: std_logic_vector(13 downto 0);
    signal addr_write: std_logic_vector(13 downto 0);
    signal vram_di: std_logic_vector(15 downto 0);
    signal vram_do: std_logic_vector(15 downto 0);
    signal vram_wr: std_logic := '0';

    signal flash : std_logic;
    signal is_flash : std_logic;
    signal rgb_fg : std_logic_vector(5 downto 0);
    signal rgb_bg : std_logic_vector(5 downto 0);

    signal selector : std_logic_vector(3 downto 0);
	 signal last_osd_command : std_logic_vector(15 downto 0);
	 signal char_buf : std_logic_vector(7 downto 0);
	 signal paper : std_logic := '0';
	 signal paper2 : std_logic := '0';
	 
	 signal hcnt : std_logic_vector(9 downto 0) := (others => '0');
	 signal vcnt : std_logic_vector(9 downto 0) := (others => '0');
	 
	 constant paper_start_h : natural := 0;
	 constant paper_end_h : natural := 720;
	 constant paper_start_v : natural := 0;
	 constant paper_end_v : natural := 576;
begin

	 -- знакогенератор
    U_FONT: entity work.Gowin_pROM_font
    port map (
        dout => font_word,
        clk => CLK,
        oce => '1',
        ce => '1',
        reset => reset,
        ad => rom_addr
    );

	 -- видеопамять OSD
    U_VRAM: entity work.Gowin_DPB_osd
    port map (
        douta => open,
        doutb => vram_do,
        clka => CLK,
        ocea => '0',
        cea => '1',
        reseta => reset,
        wrea => vram_wr,
        clkb => CLK,
        oceb => '1',
        ceb => '1',
        resetb => reset,
        wreb => '0',
        ada => addr_write,
        dina => vram_di,
        adb => addr_read,
        dinb => (others => '0')
    );

    flash <= '0';
    hcnt <= hcnt_i(9 downto 0);
    vcnt <= vcnt_i(9 downto 0);

    char_x <= hcnt(3 downto 1);
    char_y <= VCNT(3 downto 1);
     
    paper2 <= '1' when hcnt >= paper_start_h and hcnt < paper_end_h and vcnt >= paper_start_v and vcnt < paper_end_v else '0'; 
    paper <= '1' when hcnt >= paper_start_h + 8 and hcnt < paper_end_h + 8 and vcnt >= paper_start_v and vcnt < paper_end_v else '0'; -- активная зона со сдвигом на одно знакоместо (8 px)
    video_on <= '1';
     
    -- чтение символа из видеопамяти и строчки знакоместа из шрифта
    -- задержка на одно знакоместо
    process (CLK, vram_do)
    begin
        if (rising_edge(CLK)) then 
                case (hcnt(3 downto 0)) is
                    when "1110" =>
                        -- задаем адрес для чтения char и attr из видео памяти
                        if (paper2 = '1') then
                            addr_read <= '0' & VCNT(9 downto 4) & '0' & HCNT(9 downto 4);
                        end if;
                    when "1111" => 
                        -- задаем адрес знакоместа из шрифта для чтения
                        attr2 <= vram_do(7 downto 0);
                    when "0000" => 
                        -- назначаем attr для нового знакоместа 
                        attr <= attr2;
                        when others => null;						
                end case;
        end if;
    end process;
     
    -- адрес фонта для чтения
    rom_addr <= vram_do(15 downto 8) & char_y when hcnt(3 downto 0) = "1111" else rom_addr;
                     
    -- читаем строку знакоместа 
    font_reg <= font_word;	 

    -- получение пикселя из строчки знакоместа шрифта
    bit_addr <= char_x(2 downto 0);

    pixel <= 
        font_reg(7) when bit_addr = "000" else 
        font_reg(6) when bit_addr = "001" else 
        font_reg(5) when bit_addr = "010" else 
        font_reg(4) when bit_addr = "011" else 
        font_reg(3) when bit_addr = "100" else 
        font_reg(2) when bit_addr = "101" else
        font_reg(1) when bit_addr = "110" else
        font_reg(0) when bit_addr = "111";

     process(CLK)
     begin 
        if (rising_edge(CLK)) then
            pixel_reg <= pixel;
        end if;
     end process;
     
    -- формирование RGB
    is_flash <= '1' when attr(3 downto 0) = "0001" else '0';
    selector <= video_on & pixel_reg & flash & is_flash;
    rgb_fg <= (attr(7) and attr(4)) & attr(7) & (attr(6) and attr(4)) & attr(6) & (attr(5) and attr(4)) & attr(5);
    rgb_bg <= (attr(3) and attr(0)) & attr(3) & (attr(2) and attr(0)) & attr(2) & (attr(1) and attr(0)) & attr(1);

     -- с прозрачностью
    RGB_O <= 
        rgb_fg when paper = '1' and (selector="1111" or selector="1001" or selector="1100" or selector="1110") and rgb_fg /= "000000" else 
        rgb_bg when paper = '1' and (selector="1011" or selector="1101" or selector="1000" or selector="1010") and rgb_bg /= "000000" else 
        RGB_I;
                
        -- заполнение видеопамяти по SPI
        process(CLK, osd_command, last_osd_command)
        begin
              if rising_edge(CLK) then
                     vram_wr <= '0';
                     if (osd_command /= last_osd_command) then 
                        last_osd_command <= osd_command;
                        case osd_command(15 downto 8) is 
                          when X"10"  => vram_wr <= '0'; addr_write(6 downto 0) <= osd_command(6 downto 0); -- x: 0...99 (100 chars in row)
                          when X"11" => vram_wr <= '0'; addr_write(13 downto 7) <= osd_command(6 downto 0); -- y: 0...74 (75 chars in column)
                          when X"12"  => vram_wr <= '0'; char_buf <= osd_command(7 downto 0); -- char
                          when X"13"  => vram_wr <= '1'; vram_di <= char_buf & osd_command(7 downto 0); -- attrs
                          when others => vram_wr <= '0';
                        end case;
                     end if;
              end if;
        end process;

end architecture;
