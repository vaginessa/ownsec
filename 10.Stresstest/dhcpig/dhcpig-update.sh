#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _   _  ____ ____ ___ ____ 
|  _ \| | | |/ ___|  _ \_ _/ ___|
| | | | |_| | |   | |_) | | |  _ 
| |_| |  _  | |___|  __/| | |_| |
|____/|_| |_|\____|_|  |___\____|
            
${normal}"

mkdir -p /opt/ITSEC/10.Stresstest/dhcpig/kamorin
cd /opt/ITSEC/10.Stresstest/dhcpig/kamorin
git clone https://github.com/kamorin/DHCPig

GITREPOROOT=/opt/ITSEC/10.Stresstest/dhcpig/kamorin/DHCPig
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=pig.py
EXECUTEABLE2=dhcPIG

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=dhcpig.desktop

cd $GITREPOROOT
sudo rm  /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f 
git pull
git submodule init
git submodule update --recursive
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL