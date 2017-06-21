#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/6.SMB/nbtscan/unixwiz.net

sudo udpatedb
sudo ldconfig

reporoot=/opt/ITSEC/1.Information-Gathering/6.SMB/nbtscan/unixwiz.net
name=nbtscan-source-1.0.35
url=http://www.unixwiz.net/tools/nbtscan-source-1.0.35.tgz
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFL=nbtscan.desktop

sudo rm -r /usr/local/bin/nbtscan

cd $reporoot
mkdir $name

wget $url
tar xvfz $name.tgz
sudo rm -f $name.tgz

cd $name 
make -j 4
sudo ln -s $reporoot/$name/nbtscan /usr/local/bin/nbtscan
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
sudo updatedb

