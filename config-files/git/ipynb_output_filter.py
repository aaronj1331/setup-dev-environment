#! /usr/bin/env python

import sys
from nbformat import read, write

json_in = read(sys.stdin, 4)

for cell in json_in.cells:
    if "outputs" in cell:
        cell.outputs = []
    if "prompt_number" in cell:
        cell.prompt_number = None
    if "execution_count" in cell:
        cell.execution_count = None

write(json_in, sys.stdout)
