--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.8.05
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9C
--Created Time: Fri May 12 18:17:12 2023

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_rPLL2
    port (
        clkout: out std_logic;
        lock: out std_logic;
        clkoutp: out std_logic;
        clkoutd: out std_logic;
        clkin: in std_logic
    );
end component;

your_instance_name: Gowin_rPLL2
    port map (
        clkout => clkout_o,
        lock => lock_o,
        clkoutp => clkoutp_o,
        clkoutd => clkoutd_o,
        clkin => clkin_i
    );

----------Copy end-------------------
