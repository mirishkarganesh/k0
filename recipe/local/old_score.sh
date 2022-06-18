#!/bin/bash

# Copyright 2012-2014  Johns Hopkins University (Author: Daniel Povey, Yenda Trmal)
#           2020,      FBK
# Apache 2.0


[ -f ./path.sh ] && . ./path.sh

# begin configuration section.
cmd=run.pl
stage=0
stats=true
beam=6
word_ins_penalty=0.0,0.5,1.0
min_lmwt=8
max_lmwt=20
iter=final
scorer=${TLT2020}/doc/TLT2020EvalScript.pl
#end configuration section.

echo "$0 $@"  # Print the command line for logging
[ -f ./path.sh ] && . ./path.sh
. parse_options.sh || exit 1;

if [ $# -ne 3 ]; then
  echo "Usage: $0 [--cmd (run.pl|queue.pl...)] <data-dir> <lang-dir|graph-dir> <decode-dir>"
  echo " Options:"
  echo "    --cmd (run.pl|queue.pl...)      # specify how to run the sub-processes."
  echo "    --stage (0|1|2)                 # start scoring script from part-way through."
  echo "    --decode_mbr (true/false)       # maximum bayes risk decoding (confusion network)."
  echo "    --min_lmwt <int>                # minumum LM-weight for lattice rescoring "
  echo "    --max_lmwt <int>                # maximum LM-weight for lattice rescoring "
  exit 1;
fi

data=$1
lang_or_graph=$2
dir=$3

symtab=$lang_or_graph/words.txt
ref=${data}/text

for f in $symtab $dir/lat.1.gz $data/text; do
  [ ! -f $f ] && echo "score.sh: no such file $f" && exit 1;
done

for wip in $(echo $word_ins_penalty | sed 's/,/ /g'); do
    mkdir -p $dir/scoring/penalty_$wip/log

    $cmd LMWT=$min_lmwt:$max_lmwt $dir/scoring/penalty_$wip/log/best_path.LMWT.log \
        lattice-scale --inv-acoustic-scale=LMWT "ark:gunzip -c $dir/lat.*.gz|" ark:- \| \
        lattice-add-penalty --word-ins-penalty=$wip ark:- ark:- \| \
        lattice-best-path --word-symbol-table=$symtab ark:- ark,t:- \| \
        utils/int2sym.pl -f 2- $symtab '|' sort -u '>' $dir/scoring/penalty_$wip/LMWT.txt 

    $cmd LMWT=$min_lmwt:$max_lmwt $dir/scoring/penalty_$wip/log/score.LMWT.log \
	${scorer} \
	-ref ${ref} \
	-test $dir/scoring/penalty_$wip/LMWT.txt '>' $dir/scoring/wer_LMWT_${wip} 
done

grep WER $dir/scoring/wer_*| awk '{print $2,$i}' | sort -n|head -1 | awk '{print $2,$3}' | tee ${dir}/best_wer
exit 0;
