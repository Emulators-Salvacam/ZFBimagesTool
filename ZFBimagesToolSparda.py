import os
import shutil
import struct
import sys
from PIL import Image
from pathlib import Path

try:

    parameter1 = sys.argv[1]
    parameter2 = sys.argv[2] 
    parameter3 = sys.argv[3] 
    parameter4 = sys.argv[4] 
    #print(f"Parameter 1: {parameter1}, Parameter 2: {parameter2}, Parameter 3: {parameter3}, Parameter 4: {parameter4}")

    BASE_DIR = parameter4 + "/"

    input_folder = BASE_DIR + parameter1
    core = parameter2
    extension = parameter3

    print(f"Processing folder: {input_folder}")

    thumb_size = (144, 208)

    # Iterate over all files in the input folder
    for file_name in os.listdir(input_folder):
        file_path = os.path.join(input_folder, file_name)

        if os.path.isfile(file_path) and file_name.lower().endswith(extension):
            # Process the rom file and create the .zfb file
            print(f"Processing file: {file_path}")
            ruta_path = Path(file_path)
            route_img = ruta_path.with_suffix(".png")

            print(f"image file: {route_img}")
            with Image.open(route_img) as img:
                img = img.resize(thumb_size)
                img = img.convert("RGB")

                raw_data = []

                # Convert image to RGB565
                for y in range(thumb_size[1]):
                    for x in range(thumb_size[0]):
                        r, g, b = img.getpixel((x, y))
                        rgb = ((r >> 3) << 11) | ((g >> 2) << 5) | (b >> 3)
                        raw_data.append(struct.pack('H', rgb))

                raw_data_bytes = b''.join(raw_data)

                # Create .zfb filename
                zfb_filename = os.path.join(input_folder, os.path.splitext(file_name)[0] + '.zfb')

                # Write the image data to the .zfb file
                with open(zfb_filename, 'wb') as zfb:
                    zfb.write(raw_data_bytes)
                    zfb.write(b'\x00\x00\x00\x00')  # Write four 00 bytes
                    zfb.write(f"{core};{os.path.splitext(file_name)[0]}.{extension}.gba".encode('utf-8'))  # Write the modified filename
                    zfb.write(b'\x00\x00')  # Write two 00 bytes

            print(f"delete image file: {route_img}")
            os.remove(route_img)

            file_rom = BASE_DIR + "ROMS/" + core + "/" + file_name

            print(f"move file: {file_path} to {file_rom}")
            shutil.move(file_path, file_rom)

            print("Archivo movido correctamente.")

    print ('ZFB files created successfully.')
except Exception as e:
    print(f'An error occurred while creating the ZFB files: {str(e)}')