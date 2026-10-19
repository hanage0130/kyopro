#!/bin/bash
while true; do
    python3 generate.py > in.txt
    ./main < in.txt > out1.txt
    ./naive <in.txt > out2.txt
    if ! diff out1.txt out2.txt; then
        echo "found"
        break
    else
        echo "match"
    fi
done