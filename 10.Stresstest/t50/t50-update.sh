#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ____   ___  
|_   _| ___| / _ \ 
  | | |___ \| | | |
  | |  ___) | |_| |
  |_| |____/ \___/ 
             
${normal}"

mkdir -p /opt/ITSEC/10.Stresstest/t50/fredericopissarra
cd /opt/ITSEC/10.Stresstest/t50/fredericopissarra
git clone https://github.com/fredericopissarra/t50

DOWNLOADDIR=/opt/ITSEC/10.Stresstest/t50/fredericopissarra/t50 
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=t50.desktop

cd $DOWNLOADDIR
sudo updatedb
sudo ldconfig
sudo make uninstall
git clean -f 
git pull
git submodule init
git submodule update --recursive

./configure
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL