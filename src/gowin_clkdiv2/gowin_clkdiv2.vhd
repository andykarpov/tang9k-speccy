--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: IP file
--GOWIN Version: V1.9.8.05
--Part Number: GW1NR-LV9QN88PC6/I5
--Device: GW1NR-9C
--Created Time: Wed May 17 19:34:17 2023

library IEEE;
use IEEE.std_logic_1164.all;

entity Gowin_CLKDIV2 is
    port (
        clkout: out std_logic;
        hclkin: in std_logic;
        resetn: in std_logic
    );
end Gowin_CLKDIV2;

architecture Behavioral of Gowin_CLKDIV2 is

    --component declaration
    component CLKDIV2
        generic (
            GSREN: in string := "false"
        );
        port (
            CLKOUT: out std_logic;
            HCLKIN: in std_logic;
            RESETN: in std_logic
        );
    end component;

begin
    clkdiv2_inst: CLKDIV2
        generic map (
            GSREN => "false"
        )
        port map (
            CLKOUT => clkout,
            HCLKIN => hclkin,
            RESETN => resetn
        );

end Behavioral; --Gowin_CLKDIV2
