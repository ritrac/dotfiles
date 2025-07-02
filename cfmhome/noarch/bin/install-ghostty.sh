#!/bin/bash
set -x
set -e

if [ ! -d ~/usr/src/ghostty ]; then
    mkdir -p ~/usr/src/ghostty
    cd ~/usr/src
    git clone https://github.com/ghostty-org/ghostty.git
fi

cd ~/usr/src/ghostty
mkdir -p /tmp/$(whoami)-zig

zig build --cache-dir /tmp/$(whoami)-zig --global-cache-dir /tmp/$(whoami)-zig -Doptimize=ReleaseFast


