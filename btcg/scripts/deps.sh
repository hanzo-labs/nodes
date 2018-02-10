#!/bin/bash

wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.12.tar.gz

tar xvzf libsodium-1.0.13.tar.gz

cd libsodium-1.0.13
./configure
make && make check
make install
