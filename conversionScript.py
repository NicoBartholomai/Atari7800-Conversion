import os

def convert(origFile):
    fileIn = open("\\Original\\" + origFile, "r")
    fileOut = open("\\Converted\\" + origFile, "w")
    currentDir = os.getcwd()

print(os.getcwd())
os.listdir()
fileIn = open("\\Original\\ARRAYS.S", "r")
fileOut = open("\\Converted\\ARRAYS.S", "w")
