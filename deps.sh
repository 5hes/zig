#!/bin/bash

TARGET="$1"
PREFIX="$(llvm-config-21 --prefix)"
ROOT="$(pwd)"

git clone --depth 1 https://github.com/madler/zlib.git
git clone --depth 1 https://github.com/facebook/zstd.git

cp "zstd/lib/zstd.h" "$PREFIX/include/zstd.h"
cp "zlib/zlib.h" "$PREFIX/include/zlib.h"
cd $PREFIX/lib

zig build-lib --name zstd \
  -target $TARGET \
  -fstrip -OReleaseFast \
  -lc \
  $(find $ROOT/zstd/ -name "*.c" | paste -sd " ")

zig build-lib --name z \
  -target $TARGET \
  -fstrip -OReleaseFast \
  -lc \
  $(find $ROOT/zlib/ -name "*.c" | paste -sd " ")
