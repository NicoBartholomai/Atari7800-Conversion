import os
import glob
import sys

def convert(origFile):
    fileIn = open(os.getcwd() + "\\Original\\" + origFile, "r")
    fileOut = open(os.getcwd() + "\\Converted\\" + origFile, "w")
    fileIn.close()
    fileOut.close()

    # CHANGES ALL FILES TO ASM IN ORIGINAL FOLDER IN THE FIRST PLACE
    # folder = os.getcwd()
    # for root, dirs, filenames in os.walk(folder):
    #     for filename in filenames:
    #         filename = os.path.join(root, filename)
    # old = ".S"
    # new = ".ASM"
    # for root, dirs, filenames in os.walk(folder):
    #     for filename in filenames:
    #         if old in filename:
    #             filename = os.path.join(root, filename)
    #             os.rename(filename, filename.replace(old,new))

    fileIn = open(os.getcwd() + "\\Original\\" + origFile, "r")
    fileOut = open(os.getcwd() + "\\Converted\\" + origFile, "w")

origFile = "ARRAYS.ASM"
fileIn = open(os.getcwd() + "\\Original\\" + origFile, "r")
fileOut = open(os.getcwd() + "\\Converted\\" + origFile, "w")
fileIn.close()
fileOut.close()

# CHANGES ALL FILES TO ASM IN ORIGINAL FOLDER IN THE FIRST PLACE
# folder = os.getcwd()
# for root, dirs, filenames in os.walk(folder):
#     for filename in filenames:
#         filename = os.path.join(root, filename)
# old = ".S"
# new = ".ASM"
# for root, dirs, filenames in os.walk(folder):
#     for filename in filenames:
#         if old in filename:
#             filename = os.path.join(root, filename)
#             os.rename(filename, filename.replace(old,new))

fileIn = open(os.getcwd() + "\\Original\\" + origFile, "r")
fileOut = open(os.getcwd() + "\\Converted\\" + origFile, "w")



