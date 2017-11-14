#!/bin/sh -e

apk add --no-cache --no-progress --upgrade \
    binutils-gold \
    cmake \
    coreutils \
    g++ \
    ninja \
    pkgconfig \
    py3-sphinx \
    subversion

cd /tmp
svn co http://llvm.org/svn/llvm-project/llvm/branches/release_50 llvm --quiet
cd llvm
mkdir build
cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_FFI:BOOL=ON -DLLVM_USE_LINKER=gold -DLLVM_ENABLE_SPHINX:BOOL=ON -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build-3 -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON ..
ninja
ninja install
cd /root

apk del \
    binutils-gold \
    cmake \
    g++ \
    ninja \
    pkgconfig \
    py3-sphinx \
    subversion
rm -rf \
    /tmp/bootstrap.sh \
    /tmp/llvm
