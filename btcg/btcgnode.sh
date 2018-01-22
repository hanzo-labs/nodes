#!/bin/bash

# Set up environment, pull latest hush software, set config, start node

apt-get update

add-apt-repository ppa:bitcoin/bitcoin
#usual equihash stuff
apt-get --assume-yes install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake
#btcg specific stuff from the usual apt-get repos
apt-get --assume-yes install libboost-all-dev autotools-dev libssl-dev libevent-dev libsodium-dev libzmq3-dev
#btcg specific stuff from btcg specific repos (in this case, ppp:bitcoin/bitcoin)
apt-get --assume-yes install libdb4.8-dev libdb4.8++-dev

wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.12.tar.gz

tar xvzf libsodium-1.0.13.tar.gz

cd libsodium-1.0.13
./configure
make && make check
make install

cd ..

git clone https://github.com/BTCGPU/BTCGPU

cd BTCGPU

./autogen.sh

./configure --disable-wallet --without-gui

make

make install

screen

./bgold-cli addnode 95.213.255.77:8338 add
./bgoldd -bootstrap -printtoconsole -connect 95.213.255.77:8338
