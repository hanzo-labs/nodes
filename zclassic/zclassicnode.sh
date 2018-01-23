#!/bin/bash

# Set up environment, pull latest komodo software, set config, start node

apt-get update

apt-get --assume-yes install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake libcurl4-openssl-dev

git clone https://github.com/z-classic/zclassic

./zclassic/zcutil/fetch-params.sh

./zclassic/zcutil/build.sh -j$(nproc)

mkdir .zclassic
touch ~/.zclassic/zclassic.conf

echo "
txindex=1
rpcallowip=127.0.0.1
rpcuser=rpcuser
rpcpassword=pnfhnadiwj239" >> ~/.zclassic/zclassic.conf

screen

./zclassic/src/zcashd
