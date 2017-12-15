#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

REPOROOT=/opt/ITSEC-Install-Scripts
BINDIR=/usr/local/bin

cd ~

git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt

cp ~/.bashrc ~/._bak_bashrc 
rm -f .bashrc && cp $REPOROOT/0.Initial/usrlcl/.bashrc .bashrc 

source ~/.bashrc

