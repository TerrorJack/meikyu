#!/bin/sh -e

apk upgrade --no-cache --no-progress
apk add --no-cache --no-progress \
    cmake \
    ninja \
    subversion

cd /tmp
tar xf z3-4.5.0.tar.gz
cd z3-z3-4.5.0
python3 scripts/mk_make.py
cd build
make -j4
make install

cd /tmp
svn co http://llvm.org/svn/llvm-project/llvm/branches/release_50 llvm --quiet
cd llvm
mkdir build
cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_FFI:BOOL=ON -DLLVM_USE_LINKER=gold -DLLVM_ENABLE_SPHINX:BOOL=ON -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build-3 -DBUILD_SHARED_LIBS:BOOL=ON ..
ninja install

cd /root

rm -rf \
    /tmp/bootstrap.sh \
    /tmp/llvm \
    /tmp/z3-4.5.0.tar.gz \
    /tmp/z3-z3-4.5.0
