#!/bin/bash

file_name=""
num_files=""

while getopts "f:d:" opt; do
  case $opt in
    f) file_name=$OPTARG ;;
    d) num_files=$OPTARG ;;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
  esac
done

if [ -z "$file_name" ] || [ -z "$num_files" ]; then
  echo "Usage: $0 -f <file_name> -d <number_of_files>"
  exit 1
fi

if [ ! -f "$file_name" ]; then
  echo "File $file_name not found!"
  exit 1
fi

total_lines=$(wc -l < "$file_name")

# Calculate lines per file, adding 1 to handle the remainder if any
lines_per_file=$((total_lines / num_files))
remainder=$((total_lines % num_files))

if [ $remainder -ne 0 ]; then
  lines_per_file=$((lines_per_file + 1))
fi

base_name=$(echo $file_name | sed 's/\(.*\)\..*/\1/')

split -d -l "$lines_per_file" "$file_name" "${base_name}_"

for file in ${base_name}_*; do
  mv "$file" "${file%_*}_$(expr ${file##*_} + 1).txt"
done

echo "Divided $file_name into $num_files files with approximately $lines_per_file lines each."
