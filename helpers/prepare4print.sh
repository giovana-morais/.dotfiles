#!/bin/bash
# usage ./prepare4print.sh filename.pdf
# it will output filename_printable.pdf

file_path=$1; 
filename=${file_path%.*};
gs -sDEVICE=pdfwrite -dPDFSETTINGS=/printer -r600  -o ${filename}_printable.pdf ${filename}.pdf

echo "printable file saved as ${filename}_printable.pdf"

