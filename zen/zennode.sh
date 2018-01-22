#!/bin/bash

# Set up environment, pull latest hush software, set config, start node

apt-get update

apt-get --assume-yes install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake

git clone https://github.com/zencashofficial/zen.git

./zen/zcutil/build.sh -j$(nproc)

./zen/zcutil/fetch-params.sh

mkdir ~/.zen
touch ~/.zen/zen.conf

screen

./zen/src/zend
