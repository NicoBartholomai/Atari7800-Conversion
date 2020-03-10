import os
import glob
import sys

def convert(origFile):
    fileIn = open(os.getcwd() + "\\Original\\" + origFile, "r")
    fileOut = open(os.getcwd() + "\\Converted\\" + origFile, "w")
    fileIn.close()
    fileOut.close()

    # CHANGES ALL FILES TO ASM IN ORIGINAL FOLDER IN THE FIRST PLACE
    folder = os.getcwd()
    for root, dirs, filenames in os.walk(folder):
        for filename in filenames:
            filename = os.path.join(root, filename)
    oldExtension = ".S"
    newExtension = ".ASM"
    for root, dirs, filenames in os.walk(folder):
        for filename in filenames:
            if oldExtension in filename:
                filename = os.path.join(root, filename)
                os.rename(filename, filename.replace(oldExtension, newExtension))

    fileIn = open(os.getcwd() + "\\Original\\" + origFile, "r")
    fileOut = open(os.getcwd() + "\\Converted\\" + origFile, "w")

    # adding line to top of file, needed to compile (includes 4 space tab)
    fileOut.write("    processor 6502\n")
    
    for line in fileIn:

        # the single quotation mark causes issues, so it is converted to the double quotations
        if line.contains("\'"):
            fileOut.write(line.replace("\'", "\""))
        
        # the single quotation mark causes issues, so it is converted to the double quotations
        if line.contains("DB"):
            fileOut.write(line.replace("DB", "DC.B"))

        # if no problems in line, write as is to converted file
        else:
            fileOut.write(line)




# TESTING AREA
# origFile = "DIGDUG.ASM"
# fileIn = open(os.getcwd() + "\\Original\\" + origFile, "r")
# fileOut = open(os.getcwd() + "\\Converted\\" + origFile, "w")
# fileIn.close()
# fileOut.close()

# CHANGES ALL FILES TO ASM IN ORIGINAL FOLDER IN THE FIRST PLACE
# folder = os.getcwd()
# for root, dirs, filenames in os.walk(folder):
#     for filename in filenames:
#         filename = os.path.join(root, filename)
# oldExtension = ".S"
# newExtension = ".ASM"
# for root, dirs, filenames in os.walk(folder):
#     for filename in filenames:
#         if oldExtension in filename:
#             filename = os.path.join(root, filename)
#             os.rename(filename, filename.replace(oldExtension, newExtension))

# fileIn = open(os.getcwd() + "\\Original\\" + origFile, "r")
# fileOut = open(os.getcwd() + "\\Converted\\" + origFile, "w")
# fileOut.write("processor 6502\n")
# for line in fileIn:
#     fileOut.write(line)



