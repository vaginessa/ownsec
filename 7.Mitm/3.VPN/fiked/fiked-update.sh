#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ___ _  _______ ____  
|  ___|_ _| |/ / ____|  _ \ 
| |_   | || ' /|  _| | | | |
|  _|  | || . \| |___| |_| |
|_|   |___|_|\_\_____|____/ 
           
${normal}"

GITREPOROOT=/opt/ITSEC/7.Mitm/3.VPN/fiked/droe/fiked
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm/3.VPN
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/3.VPN
DSKTPFL=fiked.desktop


if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/3.VPN/fiked/droe
cd /opt/ITSEC/7.Mitm/3.VPN/fiked/droe
git clone https://github.com/droe/fiked.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

sudo ldconfig
sudo updatedb


cd $GITREPOROOT

sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

sudo rm -f makefile
cp GNUmakefile makefile
make -j 4
sudo make install
sudo rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

