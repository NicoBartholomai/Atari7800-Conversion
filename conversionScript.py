import os
import re
from shutil import copyfile

def convert(input, output, heading, log):

    input_path = os.getcwd() + "\\" + input
    output_path = os.getcwd() + "\\" + output

    for root, dirs, files in os.walk(input_path):
        for file in files:
            org_index = {}
            cur_index = 'heading'

            # Adds all files from input to output and changes extension
            if '.S' in file:
                line_count = 0

                copyfile(root + "\\" + file, output_path + "\\" + file[:-2] + ".ASM")

                file_in = open(root + "\\" + file, 'r')
                file_out = open(output_path + "\\" + file[:-2] + ".ASM", 'w')
                log_out = None

                if log:
                    log_out = open(output_path + "\\" + file[:-2] + "_log.txt", 'w')

                # Adds compilation setting
                org_index[cur_index] = "\t" + "processor 6502 \n"
                line_count += 1
                if log:
                    log_out.write('Line ' + str(line_count) + ': added processor 6502 heading\n')

                for line in file_in:
                    line_count += 1
                    if line.strip() != 'END':
                        out = line

                        # Change single quote to double
                        if "\'" in out:
                            out = out.replace("\'", "\"")
                            if log:
                                log_out.write('Line ' + str(line_count) + ': converted quote \' to \"\n')
        
                        # Adds semicolon to mark off old comments
                        if "*" in out:
                            out = out.replace("*", ";*")
                            if log:
                                log_out.write('Line ' + str(line_count) + ': changed * to ; for comments\n')

                        # Change DB command to DC.B
                        if " DB " in out:
                            out = out.replace(" DB ", " DC.B ")
                            if log:
                                log_out.write('Line ' + str(line_count) + ': converted DB opcode to DC.B\n')

                        # Remove Accumulator References
                        x = re.search('((LSR)|(ASL)|(ROR)|(ROL))(\s+)(A)', out)
                        if x is not None:
                            out = out[:x.start() + 3] + out[x.end():]
                            if log:
                                log_out.write('Line ' + str(line_count) + ': removed accumulator \'A\' reference\n')

                        # Remove 0 Prefixes that are not octal
                        x = re.finditer('(,|\s)0\d+', out)
                        offset = 0
                        for i in x:
                            out = out[:i.start() + 1 - offset] + out[i.start() + 2 - offset:]
                            if log:
                                log_out.write('Line ' + str(line_count) + ': removed octal prefix\n')
                            offset += 1

                        # Comment out extraneous info
                        x = re.search('\s{10}', out[10:])
                        if x is not None:
                            index = 10 + x.start()
                            out = out[:index] + ';' + out[index:]
                            if log:
                                log_out.write('Line ' + str(line_count) + ': commented out non-executable string\n')
                        
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
                            if log:
                                log_out.write('Line ' + str(line_count) + ': converted low bit operator\n')

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
                            if log:
                                log_out.write('Line ' + str(line_count) + ': converted high bit operator\n')

                        x = re.search('ORG(\s)+(\$)*(\d|[A-F])+', out)
                        if x is not None:
                            cur_index = out[x.start() + 3:].strip().split()[0]
                            org_index[cur_index] = ''

                        org_index[cur_index] += out

                file_out.write(org_index['heading'])

                emulator_heading = open(root + "\\" + heading, 'r')
                for line in emulator_heading:
                    file_out.write(line)

                for key in sorted(org_index.keys()):
                    if key != "heading":
                        file_out.write(org_index[key])
                        
                file_out.write('END')

                file_in.close()
                file_out.close()

convert("Original", "Converted", "header.txt", True)



