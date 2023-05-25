--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.8.05
--Part Number: GW1NR-LV9QN88C6/I5
--Device: GW1NR-9C
--Created Time: Tue May  9 16:23:42 2023

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_CLKDIV
    port (
        clkout: out std_logic;
        hclkin: in std_logic;
        resetn: in std_logic
    );
end component;

your_instance_name: Gowin_CLKDIV
    port map (
        clkout => clkout_o,
        hclkin => hclkin_i,
        resetn => resetn_i
    );

----------Copy end-------------------
