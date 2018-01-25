#!/bin/bash

# Set up environment, pull latest komodo software, set config, start node

apt-get update

apt-get --assume-yes install build-essential cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libminiupnpc-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz git python zlib1g-dev wget

git clone https://github.com/monero-project/monero

cd monero
make -j$(nproc)

mkdir ~/.monero/
touch ~/.monero/monero.conf

echo "
log-file=~/.monero/monero.log
log-level=0
restricted-rpc=true" >> ~/.monero.conf

./build/release/bin/monerod --detach --config-file=~/.monero/monero.conf
