#!/usr/bin/env bash

sd="route_to_SD"

createZFB() {
    folder=$1
    core=$2
    ext=$3
    echo "Processing core: $core - $ext"
    python3 ./ZFBimagesToolSparda.py $folder $core $ext $sd
}

# FC  - chip8
createZFB "FC" "chip8" "ch8"
createZFB "FC" "chip8" "c8"
# PCE - zx81
createZFB "SFC" "zx81" "p"
# SFC - spectrum
createZFB "MD" "spec" "tap"
createZFB "MD" "spec" "z80"
createZFB "MD" "spec" "tzx"
# MD  - game gear y master system
createZFB "GB" "sega" "gg"
createZFB "GB" "sega" "sms"
# GB  - nes
#createZFB "GBC" "nes" "nes"
createZFB "GBC" "nesq" "nes"
#GBC - game boy, game boy color y gba
createZFB "GBA" "gb" "gb"
createZFB "GBA" "gb" "gbc"
createZFB "GBA" "gba" "gba"
#GBA - mame
createZFB "ARCADE" "m2k" "zip"
#createZFB "GBA" "cps1" "zip"
#PCE- doom, wolf3d
createZFB "PCE" "prboom" "wad"
createZFB "PCE" "wolf3d" "exe"

python3 "route_to_Frogtool" + /frogtool.py ${sd} ALL GB300V2 -sc
cp History.bin ${sd}/Resources/History.bin
cp History.bin ${sd}/Resources/Favorites.bin
truncate -s 0 ${sd}/log.txt
