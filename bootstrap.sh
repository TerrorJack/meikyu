#!/bin/sh

apk add --no-cache --no-progress --upgrade autoconf automake curl gcc ghc git gmp-dev libedit-dev libffi-dev make musl-dev pkgconfig py3-sphinx tar zlib-dev

update-alternatives --install /usr/bin/sphinx-apidoc sphinx-apidoc /usr/bin/sphinx-apidoc-3 30
update-alternatives --install /usr/bin/sphinx-autogen sphinx-autogen /usr/bin/sphinx-autogen-3 30
update-alternatives --install /usr/bin/sphinx-build sphinx-build /usr/bin/sphinx-build-3 30
update-alternatives --install /usr/bin/sphinx-quickstart sphinx-quickstart /usr/bin/sphinx-quickstart-3 30

mkdir -p /root/.local/bin
export PATH=/root/.local/bin:$PATH
curl -sSL https://github.com/commercialhaskell/stack/releases/download/v1.6.0.20171022/stack-1.6.0.20171022-linux-x86_64-static.tar.gz | tar xz --wildcards --strip-components=1 -C /root/.local/bin '*/stack'
stack --resolver lts-9 --system-ghc install alex happy hscolour

git clone --recursive git://git.haskell.org/ghc.git
cd ghc
git checkout ghc-8.2.2-rc3
git submodule update --init
mv /tmp/build.mk mk/
./boot
./configure --prefix=/root/.stack/programs/x86_64-linux/ghc-8.2.1.20171108
make -j2
make install
printf "installed" > /root/.stack/programs/x86_64-linux/ghc-8.2.1.20171108.installed
cd /root

apk del ghc
mv /root/.stack/config.yaml /tmp/config.yaml
mv /root/.stack/programs /tmp/programs
rm -rf /root/.stack /root/ghc /tmp/bootstrap.sh
mkdir /root/.stack
mv /tmp/config.yaml /root/.stack/
mv /tmp/programs /root/.stack/programs
stack --resolver nightly-2017-11-10 install --haddock alex happy hscolour
