git clone https://github.com/zencashofficial/zen.git

./zen/zcutil/build.sh -j$(nproc)

./zen/zcutil/fetch-params.sh

mkdir ~/.zen
touch ~/.zen/zen.conf
