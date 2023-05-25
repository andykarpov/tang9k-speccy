//Copyright (C)2014-2023 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.8.05 
//Created Time: 2023-05-15 10:24:04
create_clock -name clk27M -period 37 -waveform {0 18} [get_ports {clk27M}]
create_clock -name clk_vga -period 35 -waveform {0 17} [get_nets {clk_vga}]
create_clock -name clk_psram -period 4 -waveform {0 2} [get_nets {clk_psram}]
create_clock -name clk_tmds -period 7 -waveform {0 3} [get_nets {clk_tmds}]
create_clock -name clk_usb -period 83 -waveform {0 41} [get_nets {clk_usb}]
create_generated_clock -name cpuclk -source [get_nets {clk_vga}] -master_clock clk_vga -divide_by 8 [get_nets {cpuclk}]
