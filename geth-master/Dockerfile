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

RUN snap install --classic go

# Build geth
COPY scripts/ scripts
RUN ./scripts/build.sh

# Copy over config
# COPY etc/bitcoingold.conf /root/.bitcoingold/bitcoingold.conf

# Run geth daemon
CMD ./go-ethereum/build/bin/geth
