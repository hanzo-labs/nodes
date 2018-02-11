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
                       libcurl4-openssl-dev \
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

COPY scripts/ scripts
RUN ./scripts/build.sh

COPY etc/hush.conf /root/.hush/hush.conf

CMD ./hush/src/hushd
