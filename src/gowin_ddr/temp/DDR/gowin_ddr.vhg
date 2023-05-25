--
--Written by GowinSynthesis
--Product Version "GowinSynthesis V1.9.8.05"
--Mon May  8 23:14:16 2023

--Source file index table:
--file0 "\/opt/Gowin/IDE/ipcore/DDR/data/ddr.v"
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library synplify;
use synplify.components.all;
library gw1n;
use gw1n.components.all;

entity Gowin_DDR is
port(
  din :  in std_logic_vector(15 downto 0);
  clk :  in std_logic;
  q :  out std_logic_vector(7 downto 0));
end Gowin_DDR;
architecture beh of Gowin_DDR is
  signal \oddr_gen[0].oddr_inst_1_Q1\ : std_logic ;
  signal \oddr_gen[1].oddr_inst_1_Q1\ : std_logic ;
  signal \oddr_gen[2].oddr_inst_1_Q1\ : std_logic ;
  signal \oddr_gen[3].oddr_inst_1_Q1\ : std_logic ;
  signal \oddr_gen[4].oddr_inst_1_Q1\ : std_logic ;
  signal \oddr_gen[5].oddr_inst_1_Q1\ : std_logic ;
  signal \oddr_gen[6].oddr_inst_1_Q1\ : std_logic ;
  signal \oddr_gen[7].oddr_inst_1_Q1\ : std_logic ;
  signal GND_0 : std_logic ;
  signal VCC_0 : std_logic ;
begin
\oddr_gen[0].oddr_inst\: ODDR
port map (
  Q0 => q(0),
  Q1 => \oddr_gen[0].oddr_inst_1_Q1\,
  D0 => din(0),
  D1 => din(8),
  TX => GND_0,
  CLK => clk);
\oddr_gen[1].oddr_inst\: ODDR
port map (
  Q0 => q(1),
  Q1 => \oddr_gen[1].oddr_inst_1_Q1\,
  D0 => din(1),
  D1 => din(9),
  TX => GND_0,
  CLK => clk);
\oddr_gen[2].oddr_inst\: ODDR
port map (
  Q0 => q(2),
  Q1 => \oddr_gen[2].oddr_inst_1_Q1\,
  D0 => din(2),
  D1 => din(10),
  TX => GND_0,
  CLK => clk);
\oddr_gen[3].oddr_inst\: ODDR
port map (
  Q0 => q(3),
  Q1 => \oddr_gen[3].oddr_inst_1_Q1\,
  D0 => din(3),
  D1 => din(11),
  TX => GND_0,
  CLK => clk);
\oddr_gen[4].oddr_inst\: ODDR
port map (
  Q0 => q(4),
  Q1 => \oddr_gen[4].oddr_inst_1_Q1\,
  D0 => din(4),
  D1 => din(12),
  TX => GND_0,
  CLK => clk);
\oddr_gen[5].oddr_inst\: ODDR
port map (
  Q0 => q(5),
  Q1 => \oddr_gen[5].oddr_inst_1_Q1\,
  D0 => din(5),
  D1 => din(13),
  TX => GND_0,
  CLK => clk);
\oddr_gen[6].oddr_inst\: ODDR
port map (
  Q0 => q(6),
  Q1 => \oddr_gen[6].oddr_inst_1_Q1\,
  D0 => din(6),
  D1 => din(14),
  TX => GND_0,
  CLK => clk);
\oddr_gen[7].oddr_inst\: ODDR
port map (
  Q0 => q(7),
  Q1 => \oddr_gen[7].oddr_inst_1_Q1\,
  D0 => din(7),
  D1 => din(15),
  TX => GND_0,
  CLK => clk);
GND_s0: GND
port map (
  G => GND_0);
VCC_s0: VCC
port map (
  V => VCC_0);
GSR_0: GSR
port map (
  GSRI => VCC_0);
end beh;
