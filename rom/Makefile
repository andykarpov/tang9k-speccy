# Makefile - GNU Makefile
#
# Copyright (c) 2023 Andy Karpov.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

SRC_DIVMMC=src/esxdos.rom src/128-0.rom src/128-1.rom
SRC_ZC=src/gluk.rom src/trdos.rom src/128p-0.rom src/128p-1.rom
SRC_DIAG=src/diagrom.rom
SRC_RAGEFIX=src/ragefix.rom
IMAGES=rom-divmmc.rom rom-zc.rom rom-diag.rom rom-ragefix.rom rom-tang9k-speccy.rom

all: $(IMAGES)

rom-divmmc.rom: $(SRC_DIVMMC)
	cat src/esxdos.rom > rom-divmmc.rom
	cat src/esxdos.rom >> rom-divmmc.rom
	cat src/esxdos.rom >> rom-divmmc.rom
	cat src/esxdos.rom >> rom-divmmc.rom
	cat src/128-0.rom >> rom-divmmc.rom
	cat src/128-1.rom >> rom-divmmc.rom

rom-zc.rom: $(SRC_ZC)
	cat src/gluk.rom > rom-zc.rom
	cat src/trdos.rom >> rom-zc.rom
	cat src/128p-0.rom >> rom-zc.rom
	cat src/128p-1.rom >> rom-zc.rom

rom-diag.rom: $(SRC_DIAG)
	cat src/diagrom.rom > rom-diag.rom
	cat src/diagrom.rom >> rom-diag.rom
	cat src/diagrom.rom >> rom-diag.rom
	cat src/diagrom.rom >> rom-diag.rom

rom-ragefix.rom: $(SRC_RAGEFIX)
	cat src/ragefix.rom > rom-ragefix.rom

rom-tang9k-speccy.rom: rom-divmmc.rom rom-zc.rom rom-diag.rom rom-ragefix.rom
	cat rom-divmmc.rom > rom-tang9k-speccy.rom
	cat rom-zc.rom >> rom-tang9k-speccy.rom
	cat rom-diag.rom >> rom-tang9k-speccy.rom
	cat rom-ragefix.rom >> rom-tang9k-speccy.rom

clean:
	rm -f $(IMAGES)

