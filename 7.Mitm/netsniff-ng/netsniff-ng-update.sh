#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ _____ _____ ____  _   _ ___ _____ _____     _   _  ____ 
| \ | | ____|_   _/ ___|| \ | |_ _|  ___|  ___|   | \ | |/ ___|
|  \| |  _|   | | \___ \|  \| || || |_  | |_ _____|  \| | |  _ 
| |\  | |___  | |  ___) | |\  || ||  _| |  _|_____| |\  | |_| |
|_| \_|_____| |_| |____/|_| \_|___|_|   |_|       |_| \_|\____|
             
${normal}"

GITREPOROOT=/opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng/netsniff-ng
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=netsniff.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng
cd /opt/ITSEC/7.Mitm/netsniff-ng/netsniff-ng
git clone https://github.com/netsniff-ng/netsniff-ng.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

./configure 
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi
