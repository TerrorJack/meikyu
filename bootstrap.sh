#!/bin/sh -e

apk upgrade --no-cache --no-progress
apk add --no-cache --no-progress \
    boost-dev \
    cmake \
    libzip-dev \
    ninja \
    sqlite-dev \
    subversion \
    vim

cd /tmp
tar xf m4ri-20140914.tar.gz
cd m4ri-20140914
autoreconf --install
./configure --enable-openmp
make -j4
make install

cd /tmp
tar xf 5.0.1.tar.gz
cd cryptominisat-5.0.1
mkdir build
cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
ninja install

cd /tmp
tar xf z3-4.5.0.tar.gz
cd z3-z3-4.5.0
mkdir build
cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
ninja install

cd /tmp
svn co http://llvm.org/svn/llvm-project/llvm/branches/release_50 llvm --quiet
cd llvm
mkdir build
cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_FFI:BOOL=ON -DLLVM_USE_LINKER=gold -DLLVM_ENABLE_SPHINX:BOOL=ON -DBUILD_SHARED_LIBS:BOOL=ON ..
ninja install

cd /root
ldconfig

rm -rf \
    /tmp/bootstrap.sh \
    /tmp/llvm \
    /tmp/m4ri-20140914.tar.gz \
    /tmp/m4ri-20140914 \
    /tmp/5.0.1.tar.gz \
    /tmp/cryptominisat-5.0.1 \
    /tmp/z3-4.5.0.tar.gz \
    /tmp/z3-z3-4.5.0
