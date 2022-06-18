#!/bin/bash

dir=$1
#find $2 -type f \( -name "*.wav" \) > wav.txt


while line in $(find $2 -type f \( -name "*.wav" \)); do
file_num=$(basename -s .wav $line)
echo -e "$file_num\t$file_num" >> $1/utt2spk
echo -e "$file_num\t$dir/$line" >> $1/wav.scp

done
