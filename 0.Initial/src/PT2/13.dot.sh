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

sudo sh -c "echo '/usr/local/lib' >> /etc/ld.so.conf"
cp -R $REPOROOT/0.Initial/usrlcl/.conky .conky
sudo rm -f $BINDIR/conky_*
cd $REPOROOT/0.Initial/settings-scripts/startstop/0.Services/5.CONKY
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/0.Initial/settings-scripts/startstop/0.Services/5.CONKY/$SHfiles $BINDIR/$SHfiles;done'

