-------------------------------------------------------------------------------
-- PSRAM Controller
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity psram is
	port(
        CLK             : in std_logic;
		CLK_MEM			: in std_logic;
        LOCK            : in std_logic;
        CLK_BUS         : in std_logic;
        RESET           : in std_logic;

        -- Loader port
        loader_act 		: in std_logic;
        loader_ram_a 	: in std_logic_vector(20 downto 0);
        loader_ram_do 	: in std_logic_vector(7 downto 0);
        loader_ram_wr 	: in std_logic;

		-- Memory port
		A				: in std_logic_vector(20 downto 0);
		DI				: in std_logic_vector(7 downto 0);
		DO				: out std_logic_vector(7 downto 0);
		WR				: in std_logic;
		RD				: in std_logic;
        BUSY            : out std_logic;

		-- PSRAM Pins
		O_psram_ck: out std_logic_vector(1 downto 0);
		O_psram_ck_n: out std_logic_vector(1 downto 0);
		IO_psram_dq: inout std_logic_vector(15 downto 0);
		IO_psram_rwds: inout std_logic_vector(1 downto 0);
		O_psram_cs_n: out std_logic_vector(1 downto 0);
		O_psram_reset_n: out std_logic_vector(1 downto 0)
);
end psram;

architecture rtl of psram is

    signal wr_data: std_logic_vector(63 downto 0);
    signal rd_data: std_logic_vector(63 downto 0);
    signal rd_data_valid : std_logic;
    signal addr : std_logic_vector(20 downto 0);
    signal cmd : std_logic;
    signal cmd_en : std_logic;
    signal init_calib : std_logic;
    signal data_mask : std_logic_vector(7 downto 0);

    type qmachine is (init, idle, read, write);
    signal state : qmachine := init;
    signal cycle : std_logic_vector(5 downto 0) := "000000";
    signal read_cycle : std_logic_vector(1 downto 0) := "00";

    signal rd_req : std_logic_vector(1 downto 0) := "00";
    signal wr_req : std_logic_vector(1 downto 0) := "00";

    signal clk_logic : std_logic;
    signal int_busy : std_logic := '0';

    signal rd_ready : std_logic := '0';
    signal buf : std_logic_vector(7 downto 0);

begin

U_PSRAM: entity work.PSRAM_Memory_Interface_HS_Top
	port map (
		clk => CLK,
		memory_clk => CLK_MEM,
		pll_lock => LOCK,
		rst_n => not RESET,

		O_psram_ck => O_psram_ck,
		O_psram_ck_n => O_psram_ck_n,
		IO_psram_dq => IO_psram_dq,
		IO_psram_rwds => IO_psram_rwds,
		O_psram_cs_n => O_psram_cs_n,
		O_psram_reset_n => O_psram_reset_n,

		wr_data => wr_data,
		rd_data => rd_data,
		rd_data_valid => rd_data_valid,
		addr => addr,
		cmd => cmd,
		cmd_en => cmd_en,
		init_calib => init_calib,
		clk_out => clk_logic,
		data_mask => data_mask
	);

process (clk_logic, RESET, loader_act, loader_ram_wr) 
begin 
    if RESET = '1' then 
        cmd <= '0';
        cmd_en <= '0';
        data_mask <= x"FF";
        cycle <= (others => '0');
        int_busy <= '1';
        rd_ready <= '0';
    elsif rising_edge(clk_logic) then 

        if (loader_act = '1') then 
            rd_req(0) <= '0';
            wr_req(0) <= loader_ram_wr;
        else 
            rd_req(0) <= RD;            
            wr_req(0) <= WR;
        end if;

        rd_req(1) <= rd_req(0);
        wr_req(1) <= wr_req(0);

        case state is

            when init =>
                if init_calib = '1' then 
                    state <= idle;
                end if;

            when idle =>
                int_busy <= '0';
                cycle <= (others => '0');
                if (wr_req(1) = '1') then
                    state <= write;
                    if (loader_act = '1') then 
                        addr <= loader_ram_a;
                        wr_data <= x"00000000000000" & loader_ram_do;
                    else 
                        addr <= A;
                        wr_data <= x"00000000000000" & DI;
                    end if;
                    data_mask <= "11111110";
                    cmd <= '1'; -- write
                    cmd_en <= '1';
                    cycle <= cycle + 1;
                elsif (rd_req(1) = '1') then
                    rd_ready <= '0';
                    state <= read;
                    addr <= A;
                    cmd <= '0'; -- read 
                    cmd_en <= '1';
                    read_cycle <= (others => '0');                    
                    cycle <= cycle + 1;
                end if;

            when read => 
                int_busy <= '1';
                cmd_en <= '0';
                cycle <= cycle + 1;
                if (rd_data_valid = '1' and read_cycle < 3) then 
                    if read_cycle = 0 then
                        rd_ready <= '1';
                        buf <= rd_data(7 downto 0);
                    end if;
                    read_cycle <= read_cycle + 1;
                end if;
                if (cycle = 13) then 
                    state <= idle;
                end if;

            when write =>
                int_busy <= '1';
                cmd_en <= '0';
                cycle <= cycle + 1;
                data_mask <= x"FF";
                if (cycle = 13) then 
                    state <= idle;
                end if;                
        end case;
    end if;
end process;

process (CLK_BUS, int_busy)
begin 
    if rising_edge(CLK_BUS) then 
        BUSY <= int_busy;
        if rd_ready = '1' then 
            DO <= buf;
        end if;
    end if;
end process;

end rtl;