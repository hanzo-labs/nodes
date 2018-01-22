#!/bin/bash

# Set up environment, pull latest komodo software, set config, start node

apt-get update

apt-get --assume-yes install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake libcurl4-openssl-dev

git clone https://github.com/jl777/komodo

./komodo/zcutil/fetch-params.sh

./komodo/zcutil/build.sh -j$(nproc)

mkdir .komodo
touch ~/.komodo/komodo.conf

echo "
txindex=1
addnode=5.9.102.210
addnode=78.47.196.146
addnode=178.63.69.164
addnode=88.198.65.74
addnode=5.9.122.241
addnode=144.76.94.38
addnode=89.248.166.91
rpcallowip=127.0.0.1
rpcuser=rpcuser
rpcpassword=pnfhnadiwj239" >> ~/.komodo/komodo.conf

screen

./komodo/src/komodod
