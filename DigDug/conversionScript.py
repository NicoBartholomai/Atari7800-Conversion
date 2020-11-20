import os
import re
from shutil import copyfile
import tkinter as tk

# Conversion Variables - Paths
input_path = ''
output_path = ''
heading_path = ''

# Conversion Variables - Log
log = False

# Conversion Variables - Extension
input_extension = '.S'
output_extension = '.ASM'

# Conversion Variables - DB
input_byte_set_opcode = 'DB'
output_byte_set_opcode = 'DC.B'

# Conversion Variable - Comments
line_start_check = 10
num_spaces_check = 10

# Conversion Variable - Remove Octal
remove_octal = True

# Conversion Variable - Remove Label Colons
remove_colons = False


def convert():

    global input_path, output_path, heading_path, log, input_extension, output_extension, \
        input_byte_set_opcode, output_byte_set_opcode, line_start_check, num_spaces_check, remove_octal, remove_colons

    input_path = os.getcwd() + "\\" + input_path
    output_path = os.getcwd() + "\\" + output_path
    heading_path = os.getcwd() + "\\" + heading_path

    for root, dirs, files in os.walk(input_path):
        for file in files:
            org_index = {}
            cur_index = 'heading'

            # Adds all files from input to output and changes extension
            if input_extension in file:
                line_count = 0

                copyfile(root + "\\" + file, output_path + "\\" + file[:-2] + output_extension)

                file_in = open(root + "\\" + file, 'r')
                file_out = open(output_path + "\\" + file[:-2] + output_extension, 'w')
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
                        if " " + input_byte_set_opcode + " " in out:
                            out = out.replace(" " + input_byte_set_opcode + " ", " " + output_byte_set_opcode + " ")
                            if log:
                                log_out.write('Line ' + str(line_count) + ': converted set byte opcode\n')

                        # Remove Accumulator References
                        x = re.search('((LSR)|(ASL)|(ROR)|(ROL))(\s+)(A)', out)
                        if x is not None:
                            out = out[:x.start() + 3] + out[x.end():]
                            if log:
                                log_out.write('Line ' + str(line_count) + ': removed accumulator \'A\' reference\n')

                        if remove_octal:
                            # Remove 0 Prefixes that are not octal
                            x = re.finditer('(,|\s)0\d+', out)
                            offset = 0
                            for i in x:
                                out = out[:i.start() + 1 - offset] + out[i.start() + 2 - offset:]
                                if log:
                                    log_out.write('Line ' + str(line_count) + ': removed octal prefix\n')
                                offset += 1

                        # Comment out extraneous info
                        x = re.search('\s{'+str(num_spaces_check)+'}', out[line_start_check:])
                        if x is not None:
                            index = line_start_check + x.start()
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

                        # Remove Colons after labels
                        if remove_colons:
                            if out[0] != ' ' and out[0] != '\t' and out[0] != ';':
                                label_end = out.find(' ')
                                if out[label_end - 1] == ':':
                                    out = out[:label_end - 1] + out[label_end:]

                        org_index[cur_index] += out

                file_out.write(org_index['heading'])

                emulator_heading = open(heading_path, 'r')
                for line in emulator_heading:
                    file_out.write(line)

                for key in sorted(org_index.keys()):
                    if key != "heading":
                        file_out.write(org_index[key])
                        
                file_out.write('END')

                file_in.close()
                file_out.close()

# https://docs.python.org/3/library/tkinter.html
class Settings(tk.Frame):
    def start(self):
        global input_path, output_path, heading_path, log, input_extension, output_extension, \
            input_byte_set_opcode, output_byte_set_opcode, line_start_check, num_spaces_check, remove_octal, remove_colons

        input_path = self.input.get()
        output_path = self.output.get()
        heading_path = self.heading.get()
        log = self.is_log_checked.get()
        input_extension = self.input_ext.get()
        output_extension = self.output_ext.get()
        input_byte_set_opcode = self.input_byte_op.get()
        output_byte_set_opcode = self.output_byte_op.get()
        line_start_check = int(self.line_start.get())
        num_spaces_check = int(self.num_space.get())
        remove_octal = self.is_octal_checked.get()
        remove_colons = self.is_colon_checked.get()
        root.destroy()

    def __init__(self, master):
        super().__init__(master)
        self.grid(column = 0)

        # Paths
        self.input_label = tk.Label(text = "Enter Relative Input Directory Path")
        self.input_label.grid(row = 0, column = 0, sticky='W')
        self.input = tk.Entry()
        self.input.grid(row = 0, column = 1)
        self.input_contents = tk.StringVar()
        self.input_contents.set('Original')
        self.input['textvariable'] = self.input_contents

        self.output_label = tk.Label(text = "Enter Relative Output Directory Path")
        self.output_label.grid(row = 1, column = 0, sticky='W')
        self.output = tk.Entry()
        self.output.grid(row = 1, column = 1)
        self.output_contents = tk.StringVar()
        self.output_contents.set('Converted')
        self.output['textvariable'] = self.output_contents

        self.heading_label = tk.Label(text = "Enter Relative Heading File Path")
        self.heading_label.grid(row = 2, column = 0, sticky='W')
        self.heading = tk.Entry()
        self.heading.grid(row = 2, column = 1)
        self.heading_contents = tk.StringVar()
        self.heading_contents.set('Original/header.txt')
        self.heading['textvariable'] = self.heading_contents

        # Log Output
        self.log_label = tk.Label(text = "Create Log Output")
        self.log_label.grid(row = 3, column = 0, sticky='W')
        self.is_log_checked = tk.BooleanVar()
        self.log_check = tk.Checkbutton(variable = self.is_log_checked)
        self.log_check.grid(row = 3, column = 1)

        # Extensions
        self.input_ext_label = tk.Label(text = "Enter Input File Extension")
        self.input_ext_label.grid(row = 4, column = 0, sticky='W')
        self.input_ext = tk.Entry()
        self.input_ext.grid(row = 4, column = 1)
        self.input_ext_contents = tk.StringVar()
        self.input_ext_contents.set('.S')
        self.input_ext['textvariable'] = self.input_ext_contents

        self.output_ext_label = tk.Label(text = "Enter Output File Extension")
        self.output_ext_label.grid(row = 5, column = 0, sticky='W')
        self.output_ext = tk.Entry()
        self.output_ext.grid(row = 5, column = 1)
        self.output_ext_contents = tk.StringVar()
        self.output_ext_contents.set('.ASM')
        self.output_ext['textvariable'] = self.output_ext_contents

        # Byte Op Codes
        self.input_byte_op_label = tk.Label(text = "Enter Input Byte Set Opcode")
        self.input_byte_op_label.grid(row = 6, column = 0, sticky='W')
        self.input_byte_op = tk.Entry()
        self.input_byte_op.grid(row = 6, column = 1)
        self.input_byte_op_contents = tk.StringVar()
        self.input_byte_op_contents.set('DB')
        self.input_byte_op['textvariable'] = self.input_byte_op_contents

        self.output_byte_op_label = tk.Label(text = "Enter Output Byte Set Opcode")
        self.output_byte_op_label.grid(row = 7, column = 0, sticky='W')
        self.output_byte_op = tk.Entry()
        self.output_byte_op.grid(row = 7, column = 1)
        self.output_byte_op_contents = tk.StringVar()
        self.output_byte_op_contents.set('DC.B')
        self.output_byte_op['textvariable'] = self.output_byte_op_contents

        # Comments
        self.line_start_label = tk.Label(text = "Check for Unescaped Comments after this many Characters")
        self.line_start_label.grid(row = 8, column = 0, sticky='W')
        self.line_start = tk.Entry()
        self.line_start.grid(row = 8, column = 1)
        self.line_start_contents = tk.StringVar()
        self.line_start_contents.set('10')
        self.line_start['textvariable'] = self.line_start_contents

        self.num_space_label = tk.Label(text = "Check for this many Spaces between Instruction and Comment")
        self.num_space_label.grid(row = 9, column = 0, sticky='W')
        self.num_space = tk.Entry()
        self.num_space.grid(row = 9, column = 1)
        self.num_space_contents = tk.StringVar()
        self.num_space_contents.set('10')
        self.num_space['textvariable'] = self.num_space_contents

        # Octal
        self.octal_label = tk.Label(text = "Remove Octal References")
        self.octal_label.grid(row = 10, column = 0, sticky='W')
        self.is_octal_checked = tk.BooleanVar()
        self.octal_check = tk.Checkbutton(variable = self.is_octal_checked)
        self.octal_check.grid(row = 10, column = 1)
        self.octal_check.select()

        # Colons
        self.colon_label = tk.Label(text="Remove Subroutine Label Colons")
        self.colon_label.grid(row=11, column=0, sticky='W')
        self.is_colon_checked = tk.BooleanVar()
        self.colon_check = tk.Checkbutton(variable=self.is_colon_checked)
        self.colon_check.grid(row=11, column=1)
        self.colon_check.select()

        # Start
        self.start_button = tk.Button(text = "Start!", command = self.start)
        self.start_button.grid(row = 12, column = 0, columnspan = 2, sticky='WE')

root = tk.Tk()
settings = Settings(root)
settings.mainloop()
convert()



