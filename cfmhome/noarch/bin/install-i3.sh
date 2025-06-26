#!/bin/bash
set -x
set -e

if [ ! -d ~/usr/src/i3 ]; then
    cd ~/usr/src/
    git clone https://github.com/i3/i3
fi

cd ~/usr/src/i3

meson build -Dprefix=~/.local/
ninja -C build install

