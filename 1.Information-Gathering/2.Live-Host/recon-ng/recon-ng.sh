#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _____ ____ ___  _   _       _   _  ____ 
|  _ \| ____/ ___/ _ \| \ | |     | \ | |/ ___|
| |_) |  _|| |  | | | |  \| |_____|  \| | |  _ 
|  _ <| |__| |__| |_| | |\  |_____| |\  | |_| |
|_| \_\_____\____\___/|_| \_|     |_| \_|\____|
            
${normal}"

sudo updatedb
sudo ldconfig

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53
git clone https://bitbucket.org/LaNMaSteR53/recon-ng.git

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=recon-ng.desktop

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/recon-ng/LaNMaSteR53/recon-ng

EXECUTEABLE1=recon-ng
EXECUTEABLE2=recon-ng
EXECUTEABLE3=recon-cli
EXECUTEABLE4=recon-cli
EXECUTEABLE5=recon-rpc
EXECUTEABLE6=recon-rpc
EXECUTEABLE7=recon-web
EXECUTEABLE8=recon-web

sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo rm -f /usr/local/bin/$EXECUTEABLE4
sudo rm -f /usr/local/bin/$EXECUTEABLE6
sudo rm -f /usr/local/bin/$EXECUTEABLE8

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE4

chmod +x $GITREPOROOT/$EXECUTEABLE5
sudo ln -s $GITREPOROOT/$EXECUTEABLE5 /usr/local/bin/$EXECUTEABLE6

chmod +x $GITREPOROOT/$EXECUTEABLE7
sudo ln -s $GITREPOROOT/$EXECUTEABLE7 /usr/local/bin/$EXECUTEABLE8
#
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


