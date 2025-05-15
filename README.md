## Goal

Manage **my** personal Linux config files.

## Main features

- easy to install: few dependencies (Bash, Git)
- never overwrite files silently
- display a diff before asking
- warn if a config files has been changed localy

## Install

```sh
DOT_REFDIR=$PWD/cfmhome/ ./cfmhome/noarch/bin/dotupdate
echo export DOT_REFDIR=$PWD/cfmhome/ > ~/.bashrc.d/dotfiles.sh
```
## Update

```sh
git pull 
dotupdate
```

