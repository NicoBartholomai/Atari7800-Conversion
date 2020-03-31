import os
from shutil import copyfile

def convert(input, output):

    input_path = os.getcwd() + "\\" + input
    output_path = os.getcwd() + "\\" + output

    for root, dirs, files in os.walk(input_path):
        for file in files:
            # Adds all files from input to output and changes extension
            copyfile(root + "\\" + file, output_path + "\\" + file[:-2] + ".ASM")

            file_in = open(root + "\\" + file, 'r')
            file_out = open(output_path + "\\" + file[:-2] + ".ASM", 'w')

            # Adds compilation setting
            file_out.write("\t" + "processor 6502 \n")

            for line in file_in:

                out = line

                # Change single quote to double
                if "\'" in line:
                    out = out.replace("\'", "\"")

                # Adds semicolon to mark off old comments
                if "*" in line:
                    out = out.replace("*", ";*")

                # Change DB command to DC.B
                if "DB" in line:
                    out = out.replace("DB", "DC.B")

                file_out.write(out)

            file_in.close()
            file_out.close()

convert("Original", "Converted")



