#!/bin/bash

# Check if input file exists
INPUT="file.txt"
OUTPUT="transposed.txt"

if [ ! -f "$INPUT" ]; then
  echo "Input file '$INPUT' not found!"
  exit 1
fi

# Transpose logic using awk
awk '
{
    for (i=1; i<=NF; i++) {
        a[NR,i] = $i
    }
}
NF > max { max = NF }
END {
    for (i = 1; i <= max; i++) {
        for (j = 1; j <= NR; j++) {
            printf "%s%s", a[j,i], (j == NR ? ORS : OFS)
        }
    }
}' "$INPUT" > "$OUTPUT"

echo "Transposed content written to '$OUTPUT'"
