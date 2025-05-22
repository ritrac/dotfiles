#!/bin/bash

if [ -f "$1/README.md" ]; then
	if type pandoc >/dev/null 2>&1; then
		pandoc -s -f markdown -t man "$1/README.md" | man -l -
	else
		less "$1/README.md"
	fi
elif [ -f "$1/README.rst" ]; then
	less "$1/README.rst"
elif [ -f "$1/TODO.org" ]; then
	less "$1/TODO.org"
else
        stat "$1"
fi
