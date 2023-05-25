--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: GowinSynthesis V1.9.8.05
--Part Number: GW1NR-LV9QN88C6/I5
--Device: GW1NR-9C
--Created Time: Mon May  8 23:14:16 2023

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_DDR
	port (
		din: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		q: out std_logic_vector(7 downto 0)
	);
end component;

your_instance_name: Gowin_DDR
	port map (
		din => din_i,
		clk => clk_i,
		q => q_o
	);

----------Copy end-------------------
