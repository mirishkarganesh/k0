#!/bin/bash

echo ""

sudo apt update &&
     sudo apt install -y \
        cmake \
        sox \
        ffmpeg \
        g++ \
        automake \
        autoconf \
        libtool \
        subversion \
        git \
        zlib1g-dev \
        unzip \
        gfortran \
        python2.7 \
        python3


git clone --depth 1 https://github.com/mirishkarganesh/k0.git &&
    cd k0/tools &&
    extras/check_dependencies.sh && 
    extras/install_mkl.sh && make -j $(nproc) &&
    cd ../src && ./configure --shared && make depend -j $(nproc) && make -j $(nproc)

echo "Congratulations you have successfully installed"
