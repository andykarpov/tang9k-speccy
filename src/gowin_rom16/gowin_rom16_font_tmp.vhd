--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.8.05
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9C
--Created Time: Tue May 16 22:57:27 2023

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_ROM16_font
    port (
        dout: out std_logic_vector(7 downto 0);
        ad: in std_logic_vector(10 downto 0)
    );
end component;

your_instance_name: Gowin_ROM16_font
    port map (
        dout => dout_o,
        ad => ad_i
    );

----------Copy end-------------------
