#!/usr/bin/env bash
git clone https://github.com/BTCGPU/BTCGPU

cd BTCGPU

./autogen.sh
./configure --disable-wallet --without-gui

make
make install
