#!/bin/bash

mkdir -p /opt/ITSEC/7.Mitm/2.DNS/dshell/USArmyResearchLab
cd /opt/ITSEC/7.Mitm/2.DNS/dshell/USArmyResearchLab
git clone https://github.com/USArmyResearchLab/Dshell

sudo ldconfig
sudo updatedb

GITREPOROOT=/opt/ITSEC/7.Mitm/2.DNS/dshell/USArmyResearchLab/Dshell
#EXECUTEABLE1=
EXECUTEABLE2=dshell
EXECUTEABLE3=dshell-decode
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm/2.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/2.DNS
DSKTPFL1=dshell.desktop
DSKTPFL2=dshell-decode.desktop
1
2
#
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo rm -f /usr/local/bin/$EXECUTEABLE3
#
cd $GITREPOROOT

make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive

#Build
make -j 4

#Install -- Create new Executeable Symlink
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE3
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2