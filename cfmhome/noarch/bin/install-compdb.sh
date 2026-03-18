#!/bin/bash


set -e

cd
cd usr/src/
mkdir compdb
python3 -m venv compdb

. compdb/bin/activate

pip install --upgrade pip

pip install compdb

