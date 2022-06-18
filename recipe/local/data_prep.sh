#!/bin/bash

# Copyright (c) 2020, FBK 
# License: Apache 2.0

tlt_data_dir=$TLT2020
sup_sfx=sup

. ./utils/parse_options.sh 

if [ -z "${TLT2020}" ] ; then
    echo Error: please set variable TLT2020
    echo
    exit
fi

#for d in train dev eval ; do
for d in train dev ; do

if ! test -d data/${d}
then
    mkdir -p data/${d}
else
    rm data/${d}/*.scp
fi

find -L ${tlt_data_dir}/audio/TLT2017${d} -name "*.wav" > data/${d}/wav.lst
if ! test -s data/${d}/wav.lst ; 
then 
    echo Error: no wav found in ${tlt_data_dir}/audio/TLT2017${d}
    exit
fi

for f in `cat data/${d}/wav.lst`;do echo `basename $f .wav` $f ; done  | sort > data/${d}/wav.scp
cat ${tlt_data_dir}/audio/TLT2017${d}.${sup_sfx} | sort > data/${d}/text

cut -d_ -f1 data/${d}/wav.scp > data/${d}/speakers
paste data/${d}/wav.scp data/${d}/speakers | awk '{print $1,$3}' > data/${d}/utt2spk
utils/utt2spk_to_spk2utt.pl data/${d}/utt2spk > data/${d}/spk2utt

utils/fix_data_dir.sh data/${d}

done
