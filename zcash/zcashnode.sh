#!/bin/bash

# Set up environment, pull latest hush software, set config, start node

apt-get update

apt-get --assume-yes install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake

git clone https://github.com/zcash/zcash

./zcash/zcutil/fetch-params.sh

./zcash/zcutil/build.sh

touch ~/.zcash/zcash.conf

echo "
addnode=mainnet.z.cash
rpcallowip=127.0.0.1
rpcuser=rpcuser
rpcpassword=pnfhnadiwj239" >> ~/.zcash/zcash.conf

screen

./zcash/src/zcashd
