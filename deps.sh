#!/bin/bash

TARGET="$1"
PREFIX="$(llvm-config-21 --prefix)"
ROOT="$(pwd)"

git clone --depth 1 https://github.com/madler/zlib.git
git clone --depth https://github.com/facebook/zstd.git

cd $PREFIX

zig build-lib --name zlib \
  -target $TARGET \
  -fstrip -OReleaseFast \
  -lc \
  $(find $ROOT/zlib/ -name "*.c" | paste -sd " ")

zig build-lib --name zstd \
  -target $TARGET \
  -fstrip -OReleaseFast \
  -lc \
  $(find $ROOT/zstd/ -name "*.c" | paste -sd " ")