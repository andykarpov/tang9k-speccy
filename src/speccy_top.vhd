library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use iEEE.numeric_std.all;

entity speccy_top is 
port (
    -- clock
    clk27M: in std_logic;

    -- tmds
    tmds_d_p : out std_logic_vector(2 downto 0);
    tmds_d_n : out std_logic_vector(2 downto 0);
    tmds_clk_p : out std_logic;
    tmds_clk_n : out std_logic;

    -- spi flash
	flash_di  : in std_logic;
	flash_ncs : out std_logic;
	flash_clk : out std_logic;
	flash_do  : out std_logic;

    -- psram magic ports for PSRAM to be inferred
    O_psram_ck : out std_logic_vector(1 downto 0);
    O_psram_ck_n : out std_logic_vector(1 downto 0);
    IO_psram_rwds : inout std_logic_vector(1 downto 0);
    IO_psram_dq : inout std_logic_vector(15 downto 0);
    O_psram_reset_n : out std_logic_vector(1 downto 0);
    O_psram_cs_n : out std_logic_vector(1 downto 0);

    -- SD card
    SD_CS : out std_logic;
    SD_SCK: out std_logic;
    SD_CMD : out std_logic;
    SD_DAT0: in std_logic;

    -- UART
    UART_TXD : out std_logic;
    UART_RXD : in std_logic;

    -- USB keyboard
    usb_dn : inout std_logic;
    usb_dp : inout std_logic;

    -- AUDIO
    DAC_OUT_L : out std_logic;
    DAC_OUT_R : out std_logic;

    -- buttons
    BTN : in std_logic_vector(1 downto 0);

    -- LEDs
    LED : out std_logic_vector(5 downto 0)    
);
end speccy_top;

architecture rtl of speccy_top is 

-- CPU0
signal cpu0_reset_n	: std_logic;
signal cpu0_clk		: std_logic;
signal cpu0_a_bus	: std_logic_vector(15 downto 0);
signal cpu0_do_bus	: std_logic_vector(7 downto 0);
signal cpu0_di_bus	: std_logic_vector(7 downto 0);
signal cpu0_mreq_n	: std_logic;
signal cpu0_iorq_n	: std_logic;
signal cpu0_wr_n	: std_logic;
signal cpu0_rd_n	: std_logic;
signal cpu0_int_n	: std_logic;
signal cpu0_inta_n	: std_logic;
signal cpu0_m1_n	: std_logic;
signal cpu0_rfsh_n	: std_logic;
signal cpu0_ena		: std_logic;
signal cpu0_mult	: std_logic_vector(1 downto 0);
signal cpu0_mem_wr	: std_logic;
signal cpu0_mem_rd	: std_logic;
signal cpu0_nmi_n	: std_logic;

-- Memory
signal rom_do_bus	: std_logic_vector(7 downto 0);
signal ram_a_bus	: std_logic_vector(7 downto 0);
signal rom_bank     : std_logic_vector(1 downto 0) := "00";
signal prev_rom_bank : std_logic_vector(1 downto 0) := "00";
signal rom_bank_reset : std_logic := '0';
signal rom_bank_reset_cnt  	: std_logic_vector(3 downto 0) := "0000";

-- Ports
signal port_xxfe_reg	: std_logic_vector(7 downto 0) := "00000000";
signal port_7ffd_reg	: std_logic_vector(7 downto 0);
signal port_dffd_reg    : std_logic_vector(7 downto 0);
signal fd_port 		    : std_logic;
signal fd_sel 			: std_logic;

-- Keyboard
signal kb_do_bus	: std_logic_vector(4 downto 0) := "11111";
signal kb_fn_bus    : std_logic_vector(1 to 12);
signal kb_joy_bus	: std_logic_vector(4 downto 0) := "00000";

-- Mouse
signal ms_but_bus	: std_logic_vector(7 downto 0);
signal ms_present	: std_logic;
signal ms_left		: std_logic;
signal ms_x_bus		: std_logic_vector(7 downto 0);
signal ms_y_bus		: std_logic_vector(7 downto 0);
signal ms_clk_out	: std_logic;
signal ms_buf_out	: std_logic;

-- Video
signal vid_a_bus	: std_logic_vector(12 downto 0);
signal vid_di_bus	: std_logic_vector(7 downto 0);
signal vid_wr		: std_logic;
signal vid_scr		: std_logic;
signal vid_hsync	: std_logic;
signal vid_vsync	: std_logic;
signal vid_blank    : std_logic;
signal vid_rgb		: std_logic_vector(5 downto 0);
signal tmds_r		: std_logic_vector(7 downto 0);
signal tmds_g	    : std_logic_vector(7 downto 0);
signal tmds_b		: std_logic_vector(7 downto 0);
signal int_pos_h    : std_logic_vector(11 downto 0) := "001011111111"; -- 767; 
signal int_pos_v    : std_logic_vector(11 downto 0) := "001001000001"; -- 607-30 = 577;
--signal int_pos_h    : std_logic_vector(11 downto 0) := "001011101111"; -- 751 (0x02ef); 
--signal int_pos_v    : std_logic_vector(11 downto 0) := "001001000000"; -- 576 (0x0240);

signal int_dec, int_inc, int_dec_v, int_inc_v : std_logic := '0';

-- OSD
signal osd_rgb      : std_logic_vector(5 downto 0);
signal hcnt         : std_logic_vector(11 downto 0);
signal vcnt         : std_logic_vector(11 downto 0);
signal osd_command  : std_logic_vector(15 downto 0);

-- MC146818A
signal mc146818_wr	    : std_logic;
signal mc146818_a_bus	: std_logic_vector(5 downto 0);
signal mc146818_do_bus	: std_logic_vector(7 downto 0);
signal port_bff7	    : std_logic;
signal port_eff7_reg	: std_logic_vector(7 downto 0);

-- PSRAM
signal psram_do_bus	: std_logic_vector(7 downto 0);
signal psram_wr		: std_logic;
signal psram_rd		: std_logic;
signal psram_rfsh	: std_logic;
signal psram_wait   : std_logic;

-- TurboSound
signal ssg_sel		: std_logic;
signal ssg_cn0_bus	: std_logic_vector(7 downto 0);
signal ssg_cn0_a	: std_logic_vector(7 downto 0);
signal ssg_cn0_b	: std_logic_vector(7 downto 0);
signal ssg_cn0_c	: std_logic_vector(7 downto 0);
signal ssg_cn1_bus	: std_logic_vector(7 downto 0);
signal ssg_cn1_a	: std_logic_vector(7 downto 0);
signal ssg_cn1_b	: std_logic_vector(7 downto 0);
signal ssg_cn1_c	: std_logic_vector(7 downto 0);
signal audio_l		: std_logic_vector(11 downto 0);
signal audio_r		: std_logic_vector(11 downto 0);
signal dac_s_l		: std_logic_vector(11 downto 0);
signal dac_s_r		: std_logic_vector(11 downto 0);
signal sound		: std_logic_vector(7 downto 0);

-- Soundrive
signal covox_a		: std_logic_vector(7 downto 0);
signal covox_b		: std_logic_vector(7 downto 0);
signal covox_c		: std_logic_vector(7 downto 0);
signal covox_d		: std_logic_vector(7 downto 0);

-- CLOCK
signal clk_bus		: std_logic;
signal clk_tmds		: std_logic;
signal clk_tmds_p   : std_logic;
signal clk_psram    : std_logic;
signal clk_psram_p  : std_logic;
signal clk_vga		: std_logic;
signal clk_usb      : std_logic;
signal ena_14mhz	: std_logic;
signal ena_7mhz		: std_logic;
signal ena_3_5mhz	: std_logic;
signal ena_1_75mhz	: std_logic;
signal ena_0_4375mhz: std_logic;
signal ena_cnt		: std_logic_vector(5 downto 0);

-- System
signal reset        : std_logic;
signal areset       : std_logic;
signal locked       : std_logic;
signal locked2      : std_logic;
signal dos_act		: std_logic := '1';
signal cpuclk		: std_logic;
signal selector		: std_logic_vector(7 downto 0);
signal mux		    : std_logic_vector(2 downto 0);

-- divmmc
signal divmmc_do	: std_logic_vector(7 downto 0);

signal divmmc_disable_zxrom : std_logic;
signal divmmc_eeprom_oe_n : std_logic;
signal divmmc_eeprom_we_n : std_logic;
signal divmmc_sram_oe_n : std_logic;
signal divmmc_sram_we_n : std_logic;
signal divmmc_sram_hiaddr : std_logic_vector(5 downto 0);

signal divmmc_cs_n	: std_logic_vector(1 downto 0);
signal divmmc_sclk	: std_logic;
signal divmmc_mosi	: std_logic;
signal divmmc_on    : std_logic := '0';

-- Z-Controller
signal zc_do_bus	: std_logic_vector(7 downto 0);
signal zc_ncs		: std_logic;
signal zc_sclk		: std_logic;
signal zc_mosi		: std_logic;
signal zc_rd		: std_logic;
signal zc_wr		: std_logic;

-- Loader
signal loader_act		: std_logic := '1';
signal loader_reset 	: std_logic := '0';
signal loader_done 	: std_logic := '0';
signal loader_ram_di	: std_logic_vector(7 downto 0);
signal loader_ram_do	: std_logic_vector(7 downto 0);
signal loader_ram_a	: std_logic_vector(20 downto 0);
signal loader_ram_wr : std_logic;
signal loader_flash_di : std_logic_vector(7 downto 0);
signal loader_flash_do : std_logic_vector(7 downto 0);
signal loader_flash_a : std_logic_vector(23 downto 0);
signal loader_flash_rd_n : std_logic;
signal loader_flash_wr_n : std_logic;
signal loader_flash_busy : std_logic;
signal loader_flash_rdy : std_logic;

-- Parallel flash interface
signal flash_a_bus: std_logic_vector(23 downto 0);
signal flash_di_bus : std_logic_vector(7 downto 0);
signal flash_do_bus: std_logic_vector(7 downto 0);
signal flash_wr_n : std_logic := '1';
signal flash_rd_n : std_logic := '1';
signal flash_er_n : std_logic := '1';
signal flash_busy : std_logic := '1';
signal flash_rdy : std_logic := '0';

signal host_flash_a_bus : std_logic_vector(23 downto 0);
signal host_flash_di_bus : std_logic_vector(7 downto 0);
signal host_flash_rd_n : std_logic := '1';
signal host_flash_wr_n : std_logic := '1';
signal host_flash_er_n : std_logic := '1';

begin 

U1: entity work.gowin_rpll
port map (
    clkin => clk27M,
    clkout => clk_tmds, -- 140
    clkoutp => clk_tmds_p, -- 140 90deg phase shifted
    lock => locked
);

U2: entity work.gowin_clkdiv
port map (
    hclkin => clk_tmds, -- 140
    clkout => clk_vga,  -- 28
    resetn => not areset
);

U3: entity work.gowin_rpll2
port map (
    clkin => clk27M, -- 27
    clkout => clk_psram, -- 224
    clkoutp => clk_psram_p, -- 224 90 deg shifted
    clkoutd => clk_usb, -- 12 (12.4)
    lock => locked2
);

clk_bus <= clk_vga;

U4: entity work.svo_hdmi_out
port map (
    resetn => not reset,
    clk_pixel => clk_bus,
    clk_5x_pixel => clk_tmds,
    locked => locked,
    rout => tmds_r,
    bout => tmds_b,
    gout => tmds_g,
    hsync_n => not vid_hsync,
    vsync_n => not vid_vsync,
    hblnk_n => vid_blank,
    tmds_clk_n => tmds_clk_n,
    tmds_clk_p => tmds_clk_p,
    tmds_d_n => tmds_d_n,
    tmds_d_p => tmds_d_p,
    tmds_ts => open
);

-- Zilog Z80A CPU
U5: entity work.T80a
port map (
	RESET_n			=> cpu0_reset_n,
	CLK_n			=> cpuclk,
	CEN			    => '1',
	WAIT_n			=> '1',
	INT_n			=> cpu0_int_n,
	NMI_n			=> cpu0_nmi_n,
	BUSRQ_n			=> '1',
	M1_n			=> cpu0_m1_n,
	MREQ_n			=> cpu0_mreq_n,
	IORQ_n			=> cpu0_iorq_n,
	RD_n			=> cpu0_rd_n,
	WR_n			=> cpu0_wr_n,
	RFSH_n			=> cpu0_rfsh_n,
	HALT_n			=> open,
	BUSAK_n			=> open,
	A				=> cpu0_a_bus,
	DIN				=> cpu0_di_bus,
	DOUT			=> cpu0_do_bus
);

-- Video Spectrum/Pentagon
U6: entity work.video
port map (
	CLK		=> clk_bus,
	INTA	=> cpu0_inta_n,
	INT		=> cpu0_int_n,
	BORDER	=> port_xxfe_reg(2 downto 0),
	BORDON	=> open, --vid_border,
	ATTR	=> open, --vid_attr,
	A		=> vid_a_bus,
	DI		=> vid_di_bus,
	BLANK	=> vid_blank,
	RGB		=> vid_rgb,
	HSYNC	=> vid_hsync,
	VSYNC	=> vid_vsync,

    HCNT_O  => hcnt,
    VCNT_O  => vcnt,

    INT_POS_H => int_pos_h,
    INT_POS_V => int_pos_v
);

-- Video RAM
U7: entity work.Gowin_DPB
    port map (
        clka => clk_bus,
        clkb => clk_bus,
        ada => vid_scr & cpu0_a_bus(12 downto 0),
        adb => port_7ffd_reg(3) & vid_a_bus,
        dina => cpu0_do_bus,
        dinb => "11111111",
        douta => open,
        doutb => vid_di_bus,
        wrea => vid_wr,
        wreb => '0',
        ocea => '1',
        oceb => '1',
        cea => '1',
        ceb => '1',
        reseta => areset,
        resetb => areset
    );

-- Esxdos ROM
U8: entity work.Gowin_pROM -- 8kb esxdos rom
    port map (
        dout => rom_do_bus,
        clk => clk_bus,
        oce => '1',
        ce => '1',
        reset => areset,
        ad => cpu0_a_bus(12 downto 0)
    );

-- TurboSound
U9: entity work.turbosound
port map (
	RESET	=> reset,
	CLK		=> clk_bus,
	ENA		=> ena_1_75mhz,
	A		=> cpu0_a_bus,
	DI		=> cpu0_do_bus,
	WR_n	=> cpu0_wr_n,
	IORQ_n	=> cpu0_iorq_n,
	M1_n	=> cpu0_m1_n,
	SEL		=> ssg_sel,
	CN0_DO	=> ssg_cn0_bus,
	CN0_A	=> ssg_cn0_a,
	CN0_B	=> ssg_cn0_b,
	CN0_C	=> ssg_cn0_c,
	CN1_DO	=> ssg_cn1_bus,
	CN1_A	=> ssg_cn1_a,
	CN1_B	=> ssg_cn1_b,
	CN1_C	=> ssg_cn1_c);

-- PSRAM Controller
U10: entity work.psram
port map (
    CLK     => clk27M,  -- ref master clock 
    CLK_MEM	=> clk_psram, -- 224 MHz
    CLK_BUS => clk_bus,
    LOCK    => locked2,
    RESET   => areset,

	-- loader signals
	loader_act 		=> loader_act,
	loader_ram_a 	=> loader_ram_a,
	loader_ram_do 	=> loader_ram_do,
	loader_ram_wr 	=> loader_ram_wr,

    -- cpu signals
	A		=> ram_a_bus & cpu0_a_bus(12 downto 0),
	DI		=> cpu0_do_bus,
	DO		=> psram_do_bus,
	WR		=> psram_wr,
	RD		=> psram_rd,
    BUSY    => psram_wait,

    -- phy
    O_psram_ck => O_psram_ck,
    O_psram_ck_n => O_psram_ck_n,
    IO_psram_dq => IO_psram_dq,
    IO_psram_rwds => IO_psram_rwds,
    O_psram_cs_n => O_psram_cs_n,
    O_psram_reset_n => O_psram_reset_n
    );

---- MC146818A
--U11: entity work.mc146818a
--port map (
--	RESET		=> reset,
--	CLK		=> clk_bus,
--	ENA		=> ena_0_4375mhz,
--	CS		=> '1',
--	WR		=> mc146818_wr,
--	A		=> mc146818_a_bus,
--	DI		=> cpu0_do_bus,
--	DO		=> mc146818_do_bus);

-- Soundrive
U12: entity work.soundrive
port map (
	RESET		=> reset,
	CLK		    => clk_bus,
	CS		    => '1',
	WR_n		=> cpu0_wr_n,
	A		    => cpu0_a_bus(7 downto 0),
	DI		    => cpu0_do_bus,
	IORQ_n		=> cpu0_iorq_n,
	DOS		    => dos_act,
	OUTA		=> covox_a,
	OUTB		=> covox_b,
	OUTC		=> covox_c,
	OUTD		=> covox_d);

-- divmmc interface
U13: entity work.divmmc
port map (

    A       => cpu0_a_bus,
    DI      => cpu0_do_bus,
    DO      => divmmc_do,
    iorq    => cpu0_iorq_n,
    mreq    => cpu0_mreq_n,
    wr      => cpu0_wr_n,
    rd      => cpu0_rd_n,
    m1      => cpu0_m1_n,
    reset   => not reset,
    clock   => clk_bus,
    
    romcs   => divmmc_disable_zxrom,
    romoe   => divmmc_eeprom_oe_n,
    romwr   => divmmc_eeprom_we_n,
    ramoe   => divmmc_sram_oe_n,
    ramwr   => divmmc_sram_we_n,
    bankout => divmmc_sram_hiaddr,
    
    card => divmmc_cs_n,
    spi_clock => divmmc_sclk,
    spi_dataout => divmmc_mosi,
    spi_datain  => SD_DAT0,
    
    poweron => not areset,
    eprom => '0',
    mapcondout => LED(4)
);

-- SPI flash parallel interface
U14: entity work.flash
port map(
	CLK 	    => clk_bus,
	RESET 	    => areset,
	
	A 		    => flash_a_bus,
	DI 		    => flash_di_bus,
	DO 		    => flash_do_bus,
	WR_N 	    => flash_wr_n,
	RD_N 	    => flash_rd_n,
	ER_N 	    => flash_er_n,

	DATA0	    => flash_di,
	NCSO	    => flash_ncs,
	DCLK	    => flash_clk,
	ASDO	    => flash_do,

	BUSY 	    => flash_busy,
	DATA_READY  => flash_rdy
);

-- Loader
U15: entity work.loader
port map(
	CLK 			=> clk_bus,
	RESET 			=> areset,
	
	RAM_A 			=> loader_ram_a,
	RAM_DO 			=> loader_ram_do,
	RAM_WR 			=> loader_ram_wr,
    RAM_WAIT        => psram_wait,
	
	FLASH_A 		=> loader_flash_a,
	FLASH_DO 		=> flash_do_bus,
	FLASH_RD_N 		=> loader_flash_rd_n,
	FLASH_BUSY 		=> flash_busy,
	FLASH_READY 	=> flash_rdy,
	
	LOADER_ACTIVE 	=> loader_act,
	LOADER_RESET 	=> loader_reset
);

-- Delta-Sigma
U16: entity work.dac
generic map (
    msbi_g => 11
)
port map (
    CLK_I   	=> clk_tmds,
    RESET_I 	=> areset,
    DAC_DATA_I	=> dac_s_l,
    DAC_O   	=> dac_out_l);

-- Delta-Sigma
U17: entity work.dac
generic map (
    msbi_g => 11
)
port map (
    CLK_I   	=> clk_tmds,
    RESET_I 	=> areset,
    DAC_DATA_I	=> dac_s_r,
    DAC_O   	=> dac_out_r);

-- USB keyboard
U18: entity work.keyboard 
port map (
    CLK     => clk_bus,
    CLK_USB => clk_usb,
    RESET => areset,

    USB_DP => usb_dp,
    USB_DN => usb_dn,

    A => cpu0_a_bus(15 downto 8),
    DO => kb_do_bus,
    FN => kb_fn_bus
);

-- Z-Controller
U19: entity work.zcontroller
port map (
	I_RESET		=> reset,
	I_CLK		=> clk_bus,
	I_ADDR		=> cpu0_a_bus(5),
	I_DATA		=> cpu0_do_bus,
	O_DATA		=> zc_do_bus,
	I_RD		=> zc_rd,
	I_WR		=> zc_wr,
	I_SDDET		=> '1',
	I_SDPROT	=> '0',
	O_CS_N		=> zc_ncs,
	O_SCLK		=> zc_sclk,
	O_MOSI		=> zc_mosi,
	I_MISO		=> SD_DAT0);

-------------------------------------------------------------------------------
-- Global signals

process (clk_bus)
begin
	if clk_bus'event and clk_bus = '0' then
		ena_cnt <= ena_cnt + 1;
	end if;
end process;

ena_14mhz <= ena_cnt(0);
ena_7mhz <= ena_cnt(1) and ena_cnt(0);
ena_3_5mhz <= ena_cnt(2) and ena_cnt(1) and ena_cnt(0);
ena_1_75mhz <= ena_cnt(3) and ena_cnt(2) and ena_cnt(1) and ena_cnt(0);
ena_0_4375mhz <= ena_cnt(5) and ena_cnt(4) and ena_cnt(3) and ena_cnt(2) and ena_cnt(1) and ena_cnt(0);

areset <= not locked;
reset <= '1' when areset = '1' or BTN(0) = '0' or loader_reset='1' or loader_act='1' or kb_fn_bus(12)='1' or rom_bank_reset = '1' else '0';

cpu0_reset_n <= not(reset) and not(loader_reset) and not(kb_fn_bus(10));
cpu0_inta_n <= cpu0_iorq_n or cpu0_m1_n;
cpu0_nmi_n <= '0' when kb_fn_bus(11)='1' or BTN(1) = '0' else '1';

-------------------------------------------------------------------------------
-- CPU clock

cpuclk <= clk_bus and cpu0_ena;
cpu0_mult <= "00";	-- 00 = 3.5MHz; 01 = 7.0MHz; 10 = 7MHz; 11 = 14MHz
process (cpu0_mult, ena_3_5mhz, ena_7mhz, ena_14mhz)
begin
	case cpu0_mult is
		when "00" => cpu0_ena <= ena_3_5mhz;
		when "01" => cpu0_ena <= ena_7mhz;
		when "10" => cpu0_ena <= ena_7mhz;
		when "11" => cpu0_ena <= ena_14mhz;
		when others => null;
	end case;
end process;

-------------------------------------------------------------------------------	
-- Z-Controller	

zc_wr 	<= '1' when (cpu0_iorq_n = '0' and cpu0_wr_n = '0' and cpu0_a_bus(7 downto 6) = "01" and cpu0_a_bus(4 downto 0) = "10111") else '0';
zc_rd 	<= '1' when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(7 downto 6) = "01" and cpu0_a_bus(4 downto 0) = "10111") else '0';

-------------------------------------------------------------------------------
-- SD sharing beterrn DivMMC / Z-Controller

divmmc_on <= '1' when rom_bank = "00" else '0';
SD_CS	<= divmmc_cs_n(0) when divmmc_on = '1' else zc_ncs;
SD_SCK 	<= divmmc_sclk when divmmc_on = '1' else zc_sclk;
SD_CMD 	<= divmmc_mosi when divmmc_on = '1' else zc_mosi;

-------------------------------------------------------------------------------
-- Ports

-- #FD port correction
-- IN A, (#FD) - read a value from a hardware port 
-- OUT (#FD), A - writes the value of the second operand into the port given by the first operand.
fd_sel <= '0' when (
	(cpu0_do_bus(7 downto 4) = "1101" and cpu0_do_bus(2 downto 0) = "011") or 
	(cpu0_di_bus(7 downto 4) = "1101" and cpu0_di_bus(2 downto 0) = "011")) else '1'; 

process(fd_sel, reset, cpu0_m1_n)
begin
	if reset='1' then
		fd_port <= '1';
	elsif rising_edge(cpu0_m1_n) then 
		fd_port <= fd_sel;
	end if;
end process;

-- порты #7e - пишутся по фронту /wr
--port_xxfe_reg <= cpu0_do_bus when cpu0_iorq_n = '0' and cpu0_a_bus(0) = '0' and (cpu0_wr_n'event and cpu0_wr_n = '1');

process (reset, clk_bus, cpu0_a_bus, dos_act, port_7ffd_reg, port_dffd_reg, cpu0_mreq_n, cpu0_wr_n, cpu0_do_bus, divmmc_on)
begin
	if reset = '1' then
		port_eff7_reg <= (others => '0');
		port_7ffd_reg <= (others => '0');
        port_dffd_reg <= (others => '0');
		dos_act <= not divmmc_on; --'1';
	elsif clk_bus'event and clk_bus = '1' then
		if cpu0_iorq_n = '0' and cpu0_wr_n = '0' and cpu0_a_bus(0) = '0' then port_xxfe_reg <= cpu0_do_bus; end if;
		if cpu0_iorq_n = '0' and cpu0_wr_n = '0' and cpu0_a_bus = X"EFF7" then port_eff7_reg <= cpu0_do_bus; end if;
        if cpu0_iorq_n = '0' and cpu0_wr_n = '0' and cpu0_m1_n = '1' and cpu0_a_bus(15) = '0' and cpu0_a_bus(1) = '0' and port_7ffd_reg(5) = '0' then port_7ffd_reg(5 downto 0) <= cpu0_do_bus(5 downto 0); end if;
		if cpu0_iorq_n = '0' and cpu0_wr_n = '0' and cpu0_a_bus = X"7FFD" and port_7ffd_reg(5) = '0' and fd_port = '1' then port_7ffd_reg(7 downto 6) <= cpu0_do_bus(7 downto 6); end if;
		if cpu0_iorq_n = '0' and cpu0_wr_n = '0' and cpu0_a_bus = X"DFFD" and port_7ffd_reg(5) = '0' and fd_port = '1' then port_dffd_reg <= cpu0_do_bus; end if;
		if cpu0_iorq_n = '0' and cpu0_wr_n = '0' and cpu0_a_bus = X"DFF7" and port_eff7_reg(7) = '1' then mc146818_a_bus <= cpu0_do_bus(5 downto 0); end if;
        if divmmc_on = '0' then -- trdos flag only for other romsets
            if cpu0_m1_n = '0' and cpu0_mreq_n = '0' and cpu0_a_bus(15 downto 8) = X"3D" and port_7ffd_reg(4) = '1' then dos_act <= '1';
            elsif cpu0_m1_n = '0' and cpu0_mreq_n = '0' and cpu0_a_bus(15 downto 14) /= "00" then dos_act <= '0'; end if;
        end if;
	end if;
end process;

------------------------------------------------------------------------------
-- RAM mux

process (clk_bus, kb_fn_bus, rom_bank, prev_rom_bank)
begin 
    if rising_edge(clk_bus) then 
        if (kb_fn_bus(1) = '1') then -- F1 = divmmc
            rom_bank <= "00";
        elsif (kb_fn_bus(2) = '1') then -- F2 = zc
            rom_bank <= "01";
        elsif (kb_fn_bus(3) = '1') then  -- F3 = diag
            rom_bank <= "10";
        elsif (kb_fn_bus(4) = '1') then  -- F4 = rage
            rom_bank <= "11";
        end if;
--         trigger a reset on rom_bank change
        if (prev_rom_bank /= rom_bank) then 
            rom_bank_reset <= '1';
            prev_rom_bank <= rom_bank;
        end if;
        if (rom_bank_reset = '1') then 
            rom_bank_reset <= '0';
        end if;
    end if;
end process;

mux <= cpu0_a_bus(15 downto 13);

process (mux, port_7ffd_reg, port_dffd_reg, ram_a_bus, cpu0_a_bus, dos_act, rom_bank, divmmc_on, divmmc_disable_zxrom, divmmc_eeprom_oe_n, divmmc_sram_oe_n, divmmc_sram_hiaddr)
begin
    if divmmc_on = '1' then -- RAM/ROM for ESXDOS preset
        case mux(2 downto 1) is
            when "00" => 
                if divmmc_on = '1' and divmmc_disable_zxrom = '1' and divmmc_eeprom_oe_n = '0' then -- ESXDOS ROM
                    ram_a_bus <= "10000000";
                elsif divmmc_on = '1' and divmmc_disable_zxrom = '1' then -- ESXDOS RAM
                    ram_a_bus <= "11" & divmmc_sram_hiaddr(5 downto 0);
                else
                    ram_a_bus <= "100001" & port_7ffd_reg(4) & cpu0_a_bus(13); -- ROM
                end if;
            when "01" => ram_a_bus <= "0000101" & cpu0_a_bus(13);	-- Seg1 RAM 4000-7FFF
            when "10" => ram_a_bus <= "0000010" & cpu0_a_bus(13);	-- Seg2 RAM 8000-BFFF
            when "11" => ram_a_bus <= "0000" & port_7ffd_reg(2 downto 0) & cpu0_a_bus(13);	-- Seg3 RAM C000-FFFF
            when others => null;
        end case;
    else
        case mux(2 downto 1) is
            when "00" => ram_a_bus <= "100" & rom_bank & not dos_act & port_7ffd_reg(4) & cpu0_a_bus(13); -- ROM
            when "01" => ram_a_bus <= "0000101" & cpu0_a_bus(13);	-- Seg1 RAM 4000-7FFF
            when "10" => ram_a_bus <= "0000010" & cpu0_a_bus(13);	-- Seg2 RAM 8000-BFFF
            when "11" => ram_a_bus <= "0" & port_dffd_reg(2 downto 0) & port_7ffd_reg(2 downto 0) & cpu0_a_bus(13);	-- Seg3 RAM C000-FFFF
            when others => null;
        end case;        
    end if;
end process;

-------------------------------------------------------------------------------
-- PSRAM

psram_wr <= '1' when cpu0_mreq_n = '0' and cpu0_wr_n = '0' and (mux(2) = '1' or mux(2 downto 1) = "01") else 
            '1' when cpu0_mreq_n = '0' and cpu0_wr_n = '0' and divmmc_on = '1' and divmmc_disable_zxrom = '1' and divmmc_sram_we_n = '0' else 
            '0';
psram_rd <= '1' when cpu0_mreq_n = '0' and cpu0_rd_n = '0' else '0';
psram_rfsh <= not cpu0_rfsh_n;

-------------------------------------------------------------------------------
-- Audio mixer

-- 12bit Delta-Sigma DAC
audio_l <= ("0000" & port_xxfe_reg(4) & "0000000") + ("0000" & ssg_cn0_a) + ("0000" & ssg_cn0_b) + ("0000" & ssg_cn1_a) + ("0000" & ssg_cn1_b) + ("0000" & covox_a) + ("0000" & covox_b);
audio_r <= ("0000" & port_xxfe_reg(4) & "0000000") + ("0000" & ssg_cn0_c) + ("0000" & ssg_cn0_b) + ("0000" & ssg_cn1_c) + ("0000" & ssg_cn1_b) + ("0000" & covox_c) + ("0000" & covox_d);

-- Convert signed audio data (range 127 to -128) to simple unsigned value.
dac_s_l <= std_logic_vector(unsigned(audio_l + 2048));
dac_s_r <= std_logic_vector(unsigned(audio_r + 2048));

-------------------------------------------------------------------------------
-- RTC

mc146818_wr 	<= '1' when (port_bff7 = '1' and cpu0_wr_n = '0') else '0';
port_bff7 	<= '1' when (cpu0_iorq_n = '0' and cpu0_a_bus = X"BFF7" and cpu0_m1_n = '1' and port_eff7_reg(7) = '1') else '0';

-------------------------------------------------------------------------------
-- CPU0 Data bus

process (selector, rom_do_bus, psram_do_bus, mc146818_do_bus, kb_do_bus, ms_but_bus, ms_x_bus, ms_y_bus, kb_joy_bus, ssg_cn0_bus, ssg_cn1_bus,
		 divmmc_do, zc_do_bus, port_7ffd_reg, port_dffd_reg)
begin
	case selector is
--      when x"00" => cpu0_di_bus <= rom_do_bus;
		when x"01" => cpu0_di_bus <= psram_do_bus;
--		when x"02" => cpu0_di_bus <= mc146818_do_bus;
		when x"03" => cpu0_di_bus <= "111" & kb_do_bus;
		when x"04" => cpu0_di_bus <= divmmc_do;
--		when x"05" => cpu0_di_bus <= ms_but_bus(7 downto 4) & '1' & not(ms_but_bus(2) & ms_but_bus(0) & ms_but_bus(1));
--		when x"06" => cpu0_di_bus <= ms_but_bus(7 downto 4) & '1' & not(ms_but_bus(2) & ms_but_bus(1) & ms_but_bus(0));
--		when x"07" => cpu0_di_bus <= ms_x_bus;
--		when x"08" => cpu0_di_bus <= ms_y_bus;
--		when x"09" => cpu0_di_bus <= "000" & kb_joy_bus;
		when x"0A" => cpu0_di_bus <= ssg_cn0_bus;
		when x"0B" => cpu0_di_bus <= ssg_cn1_bus;
        when x"0C" => cpu0_di_bus <= zc_do_bus;
		when x"0D" => cpu0_di_bus <= port_7ffd_reg;
		when x"0E" => cpu0_di_bus <= port_dffd_reg;
--		when x"0F" => cpu0_di_bus <= vid_attr;
		when others  => cpu0_di_bus <= (others => '1');
	end case;
end process;

selector <= 
--          x"00" when (cpu0_mreq_n = '0' and cpu0_rd_n = '0' and divmmc_on = '1' and divmmc_disable_zxrom = '1' and divmmc_eeprom_cs_n = '0' and divmmc_eeprom_we_n = '1') else -- Esxdos ROM
			x"01" when (cpu0_mreq_n = '0' and cpu0_rd_n = '0') else 													        -- PSRAM
--			x"02" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and port_bff7 = '1' and port_eff7_reg(7) = '1') else 		        -- MC146818A
			x"03" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus( 7 downto 0) = X"FE") else 				        -- xxFE
			x"04" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(7 downto 0)  = X"EB" and divmmc_on = '1') else	    -- DivMMC
--			x"05" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(15 downto 0) = X"FADF" and ms_present = '1' and ms_left = '0') else 	-- Mouse Port FADF[11111010_11011111] = <Z>1<MB><LB><RB>
--			x"06" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(15 downto 0) = X"FADF" and ms_present = '1' and ms_left = '1') else
--			x"07" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(15 downto 0) = X"FBDF" and ms_present = '1') else	-- Port FBDF[11111011_11011111] = <X>
--			x"08" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(15 downto 0) = X"FFDF" and ms_present = '1') else	-- Port FFDF[11111111_11011111] = <Y>
--			x"09" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus( 7 downto 0) = X"1F" and dos_act = '0') else 	    -- Joystick, poer xx1F
			x"0A" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(15 downto 0) = X"FFFD" and ssg_sel = '0') else 	-- TurboSound
			x"0B" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(15 downto 0) = X"FFFD" and ssg_sel = '1') else
            x"0C" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(7 downto 6) = "01" and cpu0_a_bus(4 downto 0) = "10111" and divmmc_on = '0') else -- ZC
			x"0D" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(15 downto 0) = X"7FFD") else						-- #7FFD
			x"0E" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus(15 downto 0) = X"DFFD") else						-- #DFFD
--			x"0F" when (cpu0_iorq_n = '0' and cpu0_rd_n = '0' and cpu0_a_bus( 7 downto 0) = X"FF" and vid_border = '1') else	-- #FF
			(others => '1');

-------------------------------------------------------------------------------
-- Video

vid_wr	<= '1' when cpu0_mreq_n = '0' and cpu0_wr_n = '0' and ((ram_a_bus = "00001010") or (ram_a_bus = "00001110")) else '0'; 
vid_scr	<= '1' when (ram_a_bus = "00001110") else '0';

U_OVERLAY: entity work.overlay
port map(
    CLK => clk_bus,
    RESET => areset,
    rgb_i => vid_rgb,
    rgb_o => osd_rgb,
    hcnt_i => hcnt,
    vcnt_i => vcnt,
    osd_command => osd_command
);

tmds_r <= osd_rgb (5 downto 4) & osd_rgb (5 downto 4) & osd_rgb (5 downto 4) & osd_rgb (5 downto 4);
tmds_g <= osd_rgb(3 downto 2) & osd_rgb(3 downto 2) & osd_rgb(3 downto 2) & osd_rgb(3 downto 2);
tmds_b <= osd_rgb(1 downto 0) & osd_rgb(1 downto 0) & osd_rgb(1 downto 0) & osd_rgb(1 downto 0);

-------------------------------------------------------------------------------
-- Loader flash / host ctl

flash_a_bus <= loader_flash_a when loader_act = '1' else host_flash_a_bus;
flash_di_bus <= "00000000" when loader_act = '1' else host_flash_di_bus;
flash_wr_n <= '1' when loader_act = '1' else host_flash_wr_n;
flash_rd_n <= loader_flash_rd_n when loader_act = '1' else host_flash_rd_n;
flash_er_n <= '1' when loader_act = '1' else host_flash_er_n;

-------------------------------------------------------------------------------
-- Misc

UART_TXD <= '0';
LED(0) <= not loader_act;
LED(1) <= not loader_done;
LED(2) <= not reset;
LED(3) <= not psram_wait;
LED(5) <= not divmmc_disable_zxrom;

-- debug INT position: F5-F6 h int pos, F7-F8 - v int pos
process (RESET, CLK_BUS, kb_fn_bus)
begin 
    if RESET = '1' then 
        int_dec <= '0'; int_inc <= '0';
        int_dec_v <= '0'; int_inc_v <= '0';
    elsif rising_edge(CLK_BUS) then 

        -- int h -
        if kb_fn_bus(5) = '1' and int_dec = '0' then 
            int_dec <= '1';
            if (int_pos_h > 0) then 
                int_pos_h <= int_pos_h - 1;
            else 
                int_pos_h <= std_logic_vector(to_unsigned(895, 12));
            end if;
        end if;
        if kb_fn_bus(5) = '0' then 
            int_dec <= '0';
        end if;

        -- int h +
        if kb_fn_bus(6) = '1' and int_inc = '0' then 
            int_inc <= '1';
            if (int_pos_h < 895) then 
                int_pos_h <= int_pos_h + 1;
            else 
                int_pos_h <= (others => '0');
            end if;
        end if;
        if kb_fn_bus(6) = '0' then 
            int_inc <= '0';
        end if;

        -- int v -
        if kb_fn_bus(7) = '1' and int_dec_v = '0' then 
            int_dec_v <= '1';
            if (int_pos_v > 0) then 
                int_pos_v <= int_pos_v - 1;
            else 
                int_pos_v <= std_logic_vector(to_unsigned(639, 12));
            end if;
        end if;
        if kb_fn_bus(7) = '0' then 
            int_dec_v <= '0';
        end if;

        -- int v +
        if kb_fn_bus(8) = '1' and int_inc_v = '0' then 
            int_inc_v <= '1';
            if (int_pos_v < 639) then 
                int_pos_v <= int_pos_v + 1;
            else 
                int_pos_v <= (others => '0');
            end if;
        end if;
        if kb_fn_bus(8) = '0' then 
            int_inc_v <= '0';
        end if;


    end if;
end process;

U_DEBUG: entity work.debug 
port map (
    clk => clk_bus,
    reset => areset,
    reg1 => "0000" & int_pos_h,
    reg2 => "0000" & int_pos_v,
    osd_command => osd_command
);

end rtl;