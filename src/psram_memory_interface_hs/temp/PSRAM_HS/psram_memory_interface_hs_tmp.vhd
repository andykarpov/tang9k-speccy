--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: GowinSynthesis V1.9.8.05
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9C
--Created Time: Fri May 12 17:32:10 2023

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component PSRAM_Memory_Interface_HS_Top
	port (
		clk: in std_logic;
		memory_clk: in std_logic;
		pll_lock: in std_logic;
		rst_n: in std_logic;
		O_psram_ck: out std_logic_vector(1 downto 0);
		O_psram_ck_n: out std_logic_vector(1 downto 0);
		IO_psram_dq: inout std_logic_vector(15 downto 0);
		IO_psram_rwds: inout std_logic_vector(1 downto 0);
		O_psram_cs_n: out std_logic_vector(1 downto 0);
		O_psram_reset_n: out std_logic_vector(1 downto 0);
		wr_data: in std_logic_vector(63 downto 0);
		rd_data: out std_logic_vector(63 downto 0);
		rd_data_valid: out std_logic;
		addr: in std_logic_vector(20 downto 0);
		cmd: in std_logic;
		cmd_en: in std_logic;
		init_calib: out std_logic;
		clk_out: out std_logic;
		data_mask: in std_logic_vector(7 downto 0)
	);
end component;

your_instance_name: PSRAM_Memory_Interface_HS_Top
	port map (
		clk => clk_i,
		memory_clk => memory_clk_i,
		pll_lock => pll_lock_i,
		rst_n => rst_n_i,
		O_psram_ck => O_psram_ck_o,
		O_psram_ck_n => O_psram_ck_n_o,
		IO_psram_dq => IO_psram_dq_io,
		IO_psram_rwds => IO_psram_rwds_io,
		O_psram_cs_n => O_psram_cs_n_o,
		O_psram_reset_n => O_psram_reset_n_o,
		wr_data => wr_data_i,
		rd_data => rd_data_o,
		rd_data_valid => rd_data_valid_o,
		addr => addr_i,
		cmd => cmd_i,
		cmd_en => cmd_en_i,
		init_calib => init_calib_o,
		clk_out => clk_out_o,
		data_mask => data_mask_i
	);

----------Copy end-------------------
