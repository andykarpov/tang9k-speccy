# ZX Spectrum on Tang Nano 9k devboard

Yet another ZX Spectrum clone on Sipeed Tang Nano 9k development board.

The firmware is still under heavy development. Border effects works incorrectly yet.

## Implemented hardware

- HDMI output at 720x576 (49Hz)
- Analog sound output
- USB Keyboard
- Z80 Soft CPU (T80a)
- DivMMC with ESXDOS 0.8.9
- Turbosound (2x AY3-8010)
- Soundrive

## How-to make it running

1. Install openFpgaLoader tool
2. Upload ROM image rom/rom-tang9k-speccy.rom into the external SPI flash by ```openFPGALoader -b tangnano9k --external-flash rom/rom-tang9k-speccy.rom```
3. Upload bitstream into the internal flash ```openFPGALoader -b tangnano9k -f impl/pnr/tang9k-speccy.fs```
4. Connect USB keyboard (+5V, GND as well as D+, D- signals via 33 Ohm resistors)
5. Prepare the SD card (FAT32, ESXDOS 0.8.9)

### Controls

- F1 - Pentagon 128 with ESXDOS 0.8.9
- F2 - Pentagon 1024 with Z-Controller
- F3 - Retroleum DiagRom
- F4 - Test firmware with RAGE umbrella

- F10 - CPU reset
- F11 - NMI
- F12 - Reset

### Debug controls

- F5,F6 - Move INT horisontal position
- F7,F8 - Move INT vertical position

## TODO
1. Refactor a videocontroller, implement it via a classic scheme with the scandoubler
2. Add i2c RTC and optionally i2c eeprom
3. Add ESP8266 module support via ZXUNO UART / AY UART or ZiFi UART standard
4. Add USB mouse as kempston mouse
5. Add USB gamepad as kempston joystick
6. Implement more video modes (like Timex hires, ULA+, etc)
7. Add Tape in/out
8. Create an addon PCB (motherboard?) for advanced peripherial

## Minimal breadboard setup

![image](https://github.com/andykarpov/tang9k-speccy/raw/master/docs/breadboard.jpg)

