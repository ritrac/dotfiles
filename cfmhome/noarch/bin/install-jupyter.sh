#!/bin/bash


set -e

cd
cd usr/src/
mkdir jupyter
python3 -m venv jupyter

. jupyter/bin/activate

pip install --upgrade pip

pip install jupyterlab jupyter-book jupyterbook-latex Sphinx mathjax myst pandas matplotlib numpy python-calamine xlrd

