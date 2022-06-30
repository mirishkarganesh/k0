# Kaldi installation setups on Ubuntu machine

## This repo helps beginners to install kaldi on to there local machine.
  
Following are the steps to be followed :
```
git clone https://github.com/mirishkarganesh/k0.git
```
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

## Reading Material

- [Step by Step guide for Acoustic Modelling with Kaldi](https://eleanorchodroff.com/tutorial/kaldi/training-acoustic-models.html)
- [Best Series of articles that explain ASR theory](https://medium.com/@jonathan_hui/speech-recognition-series-71fd6784551a)
- [To understand Kaldi Lattices](https://kaldi-asr.org/doc/lattices.html)
- [A blog on Kaldi Lattices](https://senarvi.github.io/kaldi-lattices/)
- [Columbia Lecture Slides on ASR](http://www.ee.columbia.edu/~stanchen/spring16/e6870/slides/)
- [Josh's Kaldi Notes. Good for basic theory](http://jrmeyer.github.io/asr/2016/02/01/Kaldi-notes.html)



## Credits

- https://github.com/kaldi-asr/kaldi
