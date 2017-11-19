#!/bin/sh -e

apk upgrade --no-cache --no-progress
apk add --no-cache --no-progress \
    autoconf \
    automake \
    bash \
    binutils-gold \
    bzip2 \
    ca-certificates \
    coreutils \
    dpkg \
    file \
    findutils \
    g++ \
    gawk \
    ghc \
    git \
    gmp-dev \
    gzip \
    libedit-dev \
    libffi-dev \
    libtool \
    make \
    musl-dev \
    numactl-dev \
    openssh \
    patch \
    perl \
    py3-sphinx \
    sed \
    tar \
    xz \
    zlib-dev

mkdir -p /root/.local/bin
tar xz --wildcards --strip-components=1 -C /root/.local/bin '*/stack' -f /tmp/stack-1.6.0.20171022-linux-x86_64-static.tar.gz
stack --no-terminal --resolver lts-9 --system-ghc install \
    alex \
    happy \
    hscolour

cd /tmp
git clone git://git.haskell.org/ghc.git
cd ghc
git checkout b8e324a4ff7d04d55dc8d8d8b9e441225c9dd4f6
git submodule update --init --recursive
mv /tmp/build.mk mk/
./boot
SPHINXBUILD=/usr/bin/sphinx-build-3 ./configure --prefix=/root/.stack/programs/x86_64-linux/ghc-8.3.20171118 --disable-ld-override
make -j4
make install
printf "installed" > /root/.stack/programs/x86_64-linux/ghc-8.3.20171118.installed
cd /root

apk del ghc
update-alternatives --install /bin/sh sh /bin/bash 44
mv /root/.stack/programs /tmp/programs
rm -rf \
    /tmp/bootstrap.sh \
    /tmp/ghc \
    /tmp/stack-1.6.0.20171022-linux-x86_64-static.tar.gz \
    /root/.local/bin/HsColour \
    /root/.local/bin/alex \
    /root/.local/bin/happy \
    /root/.stack
mkdir /root/.stack
mv /tmp/config.yaml /root/.stack/
mv /tmp/programs /root/.stack/programs
