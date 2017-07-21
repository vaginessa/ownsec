#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _____    ___     _______ ____  
|  _ \| ____|  / \ \   / / ____|  _ \ 
| |_) |  _|   / _ \ \ / /|  _| | |_) |
|  _ <| |___ / ___ \ V / | |___|  _ < 
|_| \_\_____/_/   \_\_/  |_____|_| \_\
            
${normal}"

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x
GITREPOGITFILE=$GITREPOROOT/.git
REPOBUILDDIR=/opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x/reaver-wps-fork-t6x/src

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/1.WPS
DSKTPFL=reaver.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x
cd /opt/ITSEC/6.Wireless/1.Wifi/1.WPS/reaver-wps-fork-t6x/t6x
git clone https://github.com/t6x/reaver-wps-fork-t6x.git

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

sudo updatedb
sudo ldconfig

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
cd $REPOBUILDDIR
./configure
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
fi
