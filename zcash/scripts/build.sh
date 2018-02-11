
#!/usr/bin/env bash

# Clone zclassic repo
git clone https://github.com/zcash/zcash

./zcash/zcutil/fetch-params.sh

./zcash/zcutil/build.sh
