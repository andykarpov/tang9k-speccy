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

## HDMI tips

Some monitors and TVs do not show a picture over the Tang Nano HDMI connector.
In this case you need to add a solder bridge instead of R1 (https://www.eevblog.com/forum/fpga/fpga-to-hdmi-variants/msg4613152/#msg4613152).

![image](https://user-images.githubusercontent.com/441297/259796004-c5a170fd-7697-4b45-83d7-d7e38e41baab.png)

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

## Pinout (WIP)

```
               -----------------
              | S2    USB    S1 |
              |                 |
 (SD CS)  ----| 38     T     63 |---- x
 (SD SI)  ----| 37     A     86 |---- x (*1V8)
 (SD SCK) ----| 36     N     85 |---- x (*1V8)
 (SD SO)  ----| 39     G     84 |---- x (*1V8)
 USBK D-  ----| 25           83 |---- x (*1V8)
 USBK D+  ----| 26     N     82 |---- x (*1V8)
 DAC R    ----| 27     A     81 |---- x (*1V8)
 DAC L    ----| 28     N     80 |---- x (*1V8)
 WIFI TX  ----| 29     O     79 |---- x (*1V8)
 WIFI RX  ----| 30           77 |---- x
 WIFI CTS ----| 33     9     76 |---- x
 USBM D-  ----| 34     K     75 |---- (HDMI D2P)
 USBM D+  ----| 40           74 |---- (HDMI D2N)
 USBJ D-  ----| 35           73 |---- (HDMI D1P)
 USBJ D+  ----| 41           72 |---- (HDMI D1N)
 TAPEIN   ----| 42           71 |---- (HDMI D0P)
 TAPEOUT  ----| 51           70 |---- (HDMI D0N)
 BEEPER   ----| 53           5V |---- 5V
 I2C SDA  ----| 54           48 |---- x
 I2C SCL  ----| 55           49 |---- x
 32KHZ    ----| 56           31 |---- x
 SQW      ----| 57           32 |---- x
 (HDMI CKN) --| 68          GND |---- GND
 (HDMI CKP) --| 69          3V3 |---- 3V3
              |                 |
              |       HDMI      |
               _________________


```

