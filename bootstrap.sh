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
tar xz --wildcards --strip-components=1 -C . '*/stack' -f /tmp/stack-1.6.1-linux-x86_64-static.tar.gz
stack --no-terminal --resolver lts-9 --system-ghc install \
    alex \
    happy \
    hscolour

cd /tmp
git clone git://git.haskell.org/ghc.git
cd ghc
git checkout $GHC_REV
git submodule update --init --recursive
mv /tmp/build.mk mk/
./boot
SPHINXBUILD=/usr/bin/sphinx-build-3 ./configure --prefix=/root/.stack/programs/x86_64-linux/ghc-$GHC_VER --disable-ld-override
make -j4
make install
sed -i -e "s,ghc-$GHC_VER,ghc-$GHC_LIB_VER," /root/.stack/programs/x86_64-linux/ghc-$GHC_VER/share/doc/ghc-$GHC_VER/html/index.html
printf "installed" > /root/.stack/programs/x86_64-linux/ghc-$GHC_VER.installed

cp -r /root/.stack/programs/x86_64-linux/ghc-$GHC_VER/share/doc/ghc-$GHC_VER/html /tmp
cd /tmp/html
touch .nojekyll
git init
git checkout -b gh-pages
git add --all
git commit -q --message="HTML documentation of ghc/ghc@$GHC_REV"
git push https://TerrorJack:$GITHUB_ACCESS_TOKEN@github.com/TerrorJack/meikyu.git gh-pages --force
cd /root

apk del ghc
mv /root/.stack/programs /tmp/programs
rm -rf \
    /tmp/bootstrap.sh \
    /tmp/ghc \
    /tmp/html \
    /tmp/stack-1.6.1-linux-x86_64-static.tar.gz \
    /root/.local/bin/HsColour \
    /root/.local/bin/alex \
    /root/.local/bin/happy \
    /root/.stack
mkdir /root/.stack
mv /tmp/config.yaml /root/.stack/
mv /tmp/programs /root/.stack/programs
