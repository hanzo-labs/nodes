#!/bin/bash

# Set up environment, pull latest komodo software, set config, start node

# BUSTED RIGHT NOW: Node does not compile. Strange compilation error. Revisit.

apt-get update

apt-get --assume-yes install build-essential cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libminiupnpc-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz git python zlib1g-dev wget

git clone https://github.com/sumoprojects/sumokoin

cd sumokoin
make -j$(nproc)

mkdir ~/.sumokoin/
touch ~/.sumokoin/sumkoin.conf

echo "
log-file=~/.sumokoin/sumokoin.log
log-level=0
restricted-rpc=true" >> ~/.sumokoin.conf

./build/release/bin/sumokoind --detach --config-file=~/.sumokoin/sumokoin.conf
