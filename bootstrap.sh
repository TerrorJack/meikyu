#!/bin/sh

apk add --no-cache --no-progress --upgrade \
    autoconf \
    automake \
    binutils-gold \
    ca-certificates \
    dpkg \
    file \
    g++ \
    gawk \
    gcc \
    ghc \
    git \
    gmp-dev \
    gzip \
    libedit-dev \
    libffi-dev \
    musl-dev \
    numactl-dev \
    openssh \
    py3-sphinx \
    tar \
    zlib-dev

update-alternatives --install /usr/bin/sphinx-apidoc sphinx-apidoc /usr/bin/sphinx-apidoc-3 30
update-alternatives --install /usr/bin/sphinx-autogen sphinx-autogen /usr/bin/sphinx-autogen-3 30
update-alternatives --install /usr/bin/sphinx-build sphinx-build /usr/bin/sphinx-build-3 30
update-alternatives --install /usr/bin/sphinx-quickstart sphinx-quickstart /usr/bin/sphinx-quickstart-3 30

mkdir -p /root/.local/bin
tar xz --wildcards --strip-components=1 -C /root/.local/bin '*/stack' -f /tmp/stack-1.6.0.20171022-linux-x86_64-static.tar.gz
stack --resolver lts-9 --system-ghc install \
    alex \
    happy \
    hscolour

cd /tmp
git clone git://git.haskell.org/ghc.git
cd ghc
git checkout e3ec2e7ae94524ebd111963faf34b84d942265b4
git submodule update --init --recursive
mv /tmp/build.mk mk/
./boot
./configure --prefix=/root/.stack/programs/x86_64-linux/ghc-8.3.20171111 --disable-ld-override
make -j2
make install
printf "installed" > /root/.stack/programs/x86_64-linux/ghc-8.3.20171111.installed
cd /root

update-alternatives --remove-all sphinx-apidoc
update-alternatives --remove-all sphinx-autogen
update-alternatives --remove-all sphinx-build
update-alternatives --remove-all sphinx-quickstart
apk del \
    autoconf \
    automake \
    binutils-gold \
    dpkg \
    file \
    g++ \
    gawk \
    ghc \
    py3-sphinx
mv /root/.stack/programs /tmp/programs
rm -rf \
    /tmp/bootstrap.sh \
    /tmp/ghc
    /tmp/stack-1.6.0.20171022-linux-x86_64-static.tar.gz \
    /root/.local/bin/HsColour \
    /root/.local/bin/alex \
    /root/.local/bin/happy \
    /root/.stack
mkdir /root/.stack
mv /tmp/config.yaml /root/.stack/
mv /tmp/programs /root/.stack/programs
