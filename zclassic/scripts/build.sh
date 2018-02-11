
#!/usr/bin/env bash

# Clone zcl repo
git clone https://github.com/z-classic/zclassic

./zclassic/zcutil/fetch-params.sh

./zclassic/zcutil/build.sh -j$(nproc)
