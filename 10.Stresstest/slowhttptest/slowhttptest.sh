#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPOROOT=/opt/ITSEC/10.Stresstest/slowhttptest/shekyan/slowhttptest

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=slowhttptest.desktop

echo "${bold}
 ____  _     _____        ___   _ _____ _____ ____ _____ _____ ____ _____ 
/ ___|| |   / _ \ \      / / | | |_   _|_   _|  _ \_   _| ____/ ___|_   _|
\___ \| |  | | | \ \ /\ / /| |_| | | |   | | | |_) || | |  _| \___ \ | |  
 ___) | |__| |_| |\ V  V / |  _  | | |   | | |  __/ | | | |___ ___) || |  
|____/|_____\___/  \_/\_/  |_| |_| |_|   |_| |_|    |_| |_____|____/ |_|  
            
${normal}"

mkdir -p /opt/ITSEC/10.Stresstest/slowhttptest/shekyan
cd /opt/ITSEC/10.Stresstest/slowhttptest/shekyan
git clone https://github.com/shekyan/slowhttptest


cd $GITREPOROOT
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

mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL