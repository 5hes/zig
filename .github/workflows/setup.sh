#!/bin/bash
curl -o llvm.sh https://apt.llvm.org/llvm.sh
sudo chmod 777 llvm.sh
sudo ./llvm.sh $LLVM_VERSION all

mkdir .zig && cd .zig
curl -o zig.tar.xz $LINK
tar -xf zig.tar.xz && rm zig.tar.xz
mv * zig && cd zig && mkdir bin && mv zig bin && export PATH=$PATH:$PWD/bin
cd ../..
llvm-config --version
export LD_LIBRARY_PATH=/usr/local/llvm/lib:$LD_LIBRARY_PATH
export LLVM_CONFIG=/usr/local/llvm/bin/llvm-config