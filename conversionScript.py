import os
import re
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
                if "\'" in out:
                    out = out.replace("\'", "\"")
 
                # Adds semicolon to mark off old comments
                if "*" in out:
                    out = out.replace("*", ";*")

                # Change DB command to DC.B
                if " DB " in out:
                    out = out.replace("DB", "DC.B")

                # Comment out extraneous info
                x = re.search('\s{10}', out[10:])
                if x is not None:
                    index = 10 + x.start()
                    out = out[:index] + ';' + out[index:]
                
                # Change all Low Bit commands
                while "L(" in out:
                    index = out.index("L(")
                    out = out[:index] + "<" + out[index + 2:]
                    index += 2
                    paren_count = 1
                    while index < len(out) and paren_count > 0:
                        if out[index] == "(":
                            paren_count += 1
                        elif out[index] == ")":
                            paren_count -= 1
                        if paren_count == 0:
                            out = out[:index] + out[index + 1:]
                        index += 1

                # Change all High Bit commands
                while "H(" in out:
                    index = out.index("H(")
                    out = out[:index] + ">" + out[index + 2:]
                    index += 2
                    paren_count = 1
                    while index < len(out) and paren_count > 0:
                        if out[index] == "(":
                            paren_count += 1
                        elif out[index] == ")":
                            paren_count -= 1
                        if paren_count == 0:
                            out = out[:index] + out[index + 1:]
                        index += 1

                x = re.search(0, out)
                if x is not None:


                file_out.write(out)

            file_in.close()
            file_out.close()

convert("Original", "Converted")



