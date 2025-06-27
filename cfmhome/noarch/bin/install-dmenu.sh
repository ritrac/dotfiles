#!/bin/bash
set -x
set -e

if [ ! -d ~/usr/src/dmenu ]; then
    cd ~/usr/src/
    git clone https://git.suckless.org/dmenu
fi

cd ~/usr/src/dmenu

sed -i 's#^PREFIX = .*#PREFIX = ~/.local#' config.mk

make clean install

