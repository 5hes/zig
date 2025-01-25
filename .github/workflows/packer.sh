#!/bin/bash
mv zig-out nightly
7z a $NAME.7z nightly
tar -cJf $NAME.tar.xz nightly
tar -cf $NAME.tar nightly
