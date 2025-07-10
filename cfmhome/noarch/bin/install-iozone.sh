#!/bin/bash

set -x
set -e

mkdir -p ~/usr/src/iozone
cd ~/usr/src/iozone

LATEST="iozone3_507"

if [ ! -d "$LATEST" ]; then
    wget "https://www.iozone.org/src/current/${LATEST}.tar"
    tar xf "${LATEST}.tar"
fi

cd $LATEST/src/current
make linux-AMD64
ln -s $PWD/iozone ~/bin/iozone
