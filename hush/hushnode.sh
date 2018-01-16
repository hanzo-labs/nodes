#!/bin/bash

# Set up environment, pull latest hush software, set config, start node

apt-get update

apt-get --assume-yes install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake

git clone https://github.com/MyHush/hush.git

./hush/zcutil/fetch-params.sh

./hush/zcutil/build.sh -j$(nproc)

touch ~/.hush/hush.conf

echo "
daemon=1
server=1
rpcallowip=127.0.0.1
rpcuser=rpcuser
rpcpassword=pnfhnab0sa

showmetrics=1

addnode=explorer.myhush.org
addnode=hushipv4.matthewreichardt.com
addnode=mmc01.madbuda.me
addnode=stilgar.leto.net
addnode=myhush.network
" >> ~/.hush/hush.conf

./hush/src/hushd
