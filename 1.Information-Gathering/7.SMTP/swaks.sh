#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey
cd /opt/ITSEC/1.Information-Gathering/7.SMTP/smtp-user-enum/pentestmonkey
git clone https://github.com/roman-rybalko/swaks.git

sudo ldconfig
sudo updatedb

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko/swaks/
EXECUTEABLE1=swaks
EXECUTEABLE2=swaks
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFL=swaks.desktop

cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
submodule update --recursive

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL