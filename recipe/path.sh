KALDI_ROOT=/home/asr/kaldi
#ESPNET_ROOT=/home/asr/espnet
ANACONDA_ROOT=/home/asr/anaconda3

[ -f $KALDI_ROOT/tools/env.sh ] && . $KALDI_ROOT/tools/env.sh
export PATH=$PWD/utils/:$KALDI_ROOT/src/bin:$KALDI_ROOT/tools/openfst/bin:$KALDI_ROOT/src/fstbin/:$KALDI_ROOT/src/gmmbin/:$KALDI_ROOT/src/featbin/:$KALDI_ROOT/src/lm/:$KALDI_ROOT/src/sgmmbin/:$KALDI_ROOT/src/sgmm2bin/:$KALDI_ROOT/src/fgmmbin/:$KALDI_ROOT/src/latbin/:$KALDI_ROOT/src/nnetbin:$KALDI_ROOT/src/nnet2bin/:$KALDI_ROOT/src/nnet3bin/:$KALDI_ROOT/src/kwsbin:$KALDI_ROOT/src/online2bin/:$KALDI_ROOT/src/ivectorbin/:$KALDI_ROOT/src/lmbin/:$PWD:$PATH
export PATH=$PWD/utils/:$KALDI_ROOT/tools/openfst/bin:$KALDI_ROOT/tools/sctk/bin:$PWD:$PATH
[ ! -f $KALDI_ROOT/tools/config/common_path.sh ] && echo >&2 "The standard file $KALDI_ROOT/tools/config/common_path.sh is not present -> Exit!" && exit 1
. $KALDI_ROOT/tools/config/common_path.sh

[ ! -d utils ] && ln -s $KALDI_ROOT/egs/wsj/s5/utils
[ ! -d steps ] && ln -s $KALDI_ROOT/egs/wsj/s5/steps

export LC_ALL=C

export LD_LIBRARY_PATH=/usr/lib32/atlas:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$ESPNET_ROOT/tools/chainer_ctc/ext/warp-ctc/build
#. "${ESPNET_ROOT}"/tools/activate_python.sh && . "${ESPNET_ROOT}"/tools/extra_path.sh
#export PATH=$ESPNET_ROOT/utils:$ESPNET_ROOT/espnet/bin:$PATH

export OMP_NUM_THREADS=1


# NOTE(kan-bayashi): Use UTF-8 in Python to avoid UnicodeDecodeError when LC_ALL=C
#source $ANACONDA_ROOT/bin/activate esp
export PYTHONIOENCODING=UTF-8
export PYTHONPATH=../../:$PYTHONPATH
