#!/usr/bin/env bash

# Clone btcg repo
git clone https://github.com/BTCGPU/BTCGPU
cd BTCGPU

# Build deps
cd depends
make
cd ..

# Configure project
./autogen.sh
./configure --disable-wallet --without-gui --prefix=`pwd`/depends/x86_64-pc-linux-gnu

# Build btcg
make
make install
