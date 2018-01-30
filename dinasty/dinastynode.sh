#!/bin/bash

# Set up environment, pull latest komodo software, set config, start node

#CURRENTLY BUSTED: Build error in make.

apt-get update

apt-get --assume-yes install build-essential gcc-4.7 cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libminiupnpc-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz git python zlib1g-dev wget

git clone https://github.com/dinastyoffreedom/dinastycoin

cd dinastycoin
make -j$(nproc)

mkdir ~/.dinasty/
touch ~/.dinasty/dinasty.conf

echo "
log-file=~/.dinasty/dinasty.log
log-level=0
restricted-rpc=true" >> ~/.dinasty.conf

./build/release/bin/dinastyd --detach --config-file=~/.dinasty/dinasty.conf
