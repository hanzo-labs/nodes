FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install autoconf \
                       automake
                       bsdmainutils \
                       build-essential \
                       g++-multilib \
                       git \
                       libc6-dev \
                       libtool \
                       m4 \
                       ncurses-dev \
                       pkg-config \
                       python \
                       unzip \
                       wget \
                       zlib1g-dev

# Add btcg deps
RUN apt-get -y install libboost-all-dev autotools-dev libssl-dev libevent-dev libsodium-dev libzmq3-dev
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get -y install libdb4.8-dev libdb4.8++-dev

# Build btcg
RUN bash scripts/deps.sh
RUN bash scripts/build.sh

# Add known good node
RUN bgold-cli addnode 95.213.255.77:8338 add

# Run btcg daemon
CMD bgoldd -bootstrap -printtoconsole -connect 95.213.255.77:8338
