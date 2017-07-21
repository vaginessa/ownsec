#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ____ ___ _   _  ____ 
|  ___|  _ \_ _| \ | |/ ___|
| |_  | |_) | ||  \| | |  _ 
|  _| |  __/| || |\  | |_| |
|_|   |_|  |___|_| \_|\____|
         
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert
git clone https://github.com/schweikert/fping.git


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/fping/schweikert/fping
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=fping.desktop

cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

./autogen.sh
./configure
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
