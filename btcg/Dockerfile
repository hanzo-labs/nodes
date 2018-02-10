FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install autoconf \
                       automake \
                       bsdmainutils \
                       build-essential \
                       curl \
                       g++-multilib \
                       git \
                       libc6-dev \
                       libtool \
                       m4 \
                       ncurses-dev \
                       pkg-config \
                       python \
                       python-software-properties \
                       software-properties-common \
                       unzip \
                       wget \
                       zlib1g-dev

# Add btcg deps
RUN apt-get -y install libboost-all-dev autotools-dev libssl-dev libevent-dev libsodium-dev libzmq3-dev
RUN add-apt-repository ppa:bitcoin/bitcoin && apt-get update
RUN apt-get -y install libdb4.8-dev libdb4.8++-dev

# Build btcg
COPY scripts/ scripts
RUN ./scripts/build.sh

# Copy over config
COPY etc/bitcoingold.conf /root/.bitcoingold/bitcoingold.conf

# Run btcg daemon
CMD ./BTCGPU/depends/x86_64-pc-linux-gnu/bin/bgoldd -bootstrap -printtoconsole
