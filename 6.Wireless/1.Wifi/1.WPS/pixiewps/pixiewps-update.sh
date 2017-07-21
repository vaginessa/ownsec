#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ _____  _____ _______        ______  ____  
|  _ \_ _\ \/ /_ _| ____\ \      / /  _ \/ ___| 
| |_) | | \  / | ||  _|  \ \ /\ / /| |_) \___ \ 
|  __/| | /  \ | || |___  \ V  V / |  __/ ___) |
|_|  |___/_/\_\___|_____|  \_/\_/  |_|   |____/ 
        
${normal}"

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire-a/pixiewps
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS/
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=pixiewps.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire-a
cd /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/pixiewps/wiire-a
git clone https://github.com/wiire-a/pixiewps.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
cd src
sudo make uninstall
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
make -j 4
sudo make install
sudo rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

