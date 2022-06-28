# Kaldi installation setups on Ubuntu machine

## This repo helps beginners to install kaldi on to there local machine.
  
Following are the steps to be followed :
```
  sudo apt update
  sudo apt install -y cmake sox ffmpeg g++ automake autoconf libtool subversion git zlib1g-dev unzip gfortran python2.7 python3
```
`go to tools/`
```
extras/check_dependencies.sh
extras/install_mkl.sh
make -j 'nproc'
extras/install_irstlm.sh
./install_srilm.sh
```
`go to src/ `
```
./configure --shared
make depend -j 'nproc'
make -j 'nproc'
```
