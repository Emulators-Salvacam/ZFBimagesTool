#!/usr/bin/env bash

sd="route_to_SD"

createZGB() {
    folder=$1
    core=$2
    ext=$3
    echo "Processing core: $core - $ext"
    cd "${sd}/${folder}"
	IFS=$'\n';	
	for file in $(ls *.${ext})
	do
    	echo "	Processing file: $file"
		touch "${core};${file%.*}.${ext}.gba"	
		zip "${core};${file%.*}.${ext}.zip" "${core};${file%.*}.${ext}.gba"
		rm "${core};${file%.*}.${ext}.gba"
		mv "${file%.*}.png" "${core};${file%.*}.${ext}.png";
		mv "${file%.*}.${ext}" "${sd}/ROMS/${core}/${file%.*}.${ext}"
	done
}

# FC  - chip8
createZGB "FC" "chip8" "ch8"
createZGB "FC" "chip8" "c8"
# PCE - zx81
createZGB "PCE" "zx81" "p"
# SFC - spectrum
createZGB "SFC" "spec" "tap"
createZGB "SFC" "spec" "z80"
createZGB "SFC" "spec" "tzx"
# MD  - game gear y master system
createZGB "MD" "sega" "gg"
createZGB "MD" "sega" "sms"
# GB  - nes
#createZGB "GB" "nes" "nes"
createZGB "GB" "nesq" "nes"
#GBC - game boy, game boy color y gba
createZGB "GBC" "gb" "gb"
createZGB "GBC" "gb" "gbc"
createZGB "GBC" "gba" "gba"
#GBA - mame
createZGB "GBA" "m2k" "zip"
#ROMS- doom, wolf3d

python3 "route_to_Frogtool" + /frogtool.py ${sd} ALL GB300 -sc
cp History.bin ${sd}/Resources/History.bin
cp History.bin ${sd}/Resources/Favorites.bin
truncate -s 0 ${sd}/log.txt