#!/bin/bash

# Set up environment, pull latest komodo software, set config, start node

apt-get update

apt-get --assume-yes install build-essential gcc-4.7 cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libminiupnpc-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz git python zlib1g-dev wget

git clone https://github.com/seredat/karbowanec

cd karbowanec
make -j$(nproc)

mkdir ~/.karbo/
touch ~/.karbo/karbo.conf

echo "
log-file=~/.karbo/karbo.log
log-level=3
restricted-rpc=true" >> ~/.karbo/karbo.conf

./build/release/src/karbowanecd --config-file=~/.karbo/karbo.conf
