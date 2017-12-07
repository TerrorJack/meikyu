#!/bin/sh -e

apk upgrade --no-cache --no-progress
apk add --no-cache --no-progress \
    autoconf \
    automake \
    bind-tools \
    binutils-gold \
    bzip2 \
    ca-certificates \
    coreutils \
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
    make \
    musl-dev \
    numactl-dev \
    openssh \
    patch \
    perl \
    py3-sphinx \
    sed \
    tar \
    wget \
    xz \
    zlib-dev

mkdir -p /root/.local/bin
cd /root/.local/bin
mv /tmp/cabal .
chmod u+x cabal
tar xz --wildcards --strip-components=1 -C . '*/stack' -f /tmp/stack-1.6.0.20171202-linux-x86_64-static.tar.gz
stack --no-terminal --resolver lts-9 --system-ghc install \
    alex \
    happy \
    hscolour

cd /tmp
git clone git://git.haskell.org/ghc.git
cd ghc
git checkout 5f332e1dab000e1f79c127d441f618280d14d2bd
git submodule update --init --recursive
mv /tmp/build.mk mk/
./boot
SPHINXBUILD=/usr/bin/sphinx-build-3 ./configure --prefix=/root/.stack/programs/x86_64-linux/ghc-8.5.20171207 --disable-ld-override
make -j4
make install
sed -i -e "s,ghc-8.5.20171207,ghc-8.5," /root/.stack/programs/x86_64-linux/ghc-8.5.20171207/share/doc/ghc-8.5.20171207/html/index.html
printf "installed" > /root/.stack/programs/x86_64-linux/ghc-8.5.20171207.installed
apk del ghc

mv /root/.stack/programs /tmp/programs
rm -rf \
    /tmp/bootstrap.sh \
    /tmp/ghc \
    /tmp/llvm \
    /tmp/stack-1.6.0.20171202-linux-x86_64-static.tar.gz \
    /root/.local/bin/HsColour \
    /root/.local/bin/alex \
    /root/.local/bin/happy \
    /root/.stack
mkdir /root/.stack
mv /tmp/config.yaml /root/.stack/
mv /tmp/programs /root/.stack/programs
