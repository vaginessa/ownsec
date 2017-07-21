#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ _____     _____ _____ _____ ____  
|  _ \_ _\ \   / / _ \_   _| ____|  _ \ 
| |_) | | \ \ / / | | || | |  _| | |_) |
|  __/| |  \ V /| |_| || | | |___|  _ < 
|_|  |___|  \_/  \___/ |_| |_____|_| \_\
                                               
${normal}"

GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec/pivoter/
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot
DSKTPFL=pivoter.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec
cd /opt/ITSEC/8.Tunnel/1.Pivot/pivoter/trustedsec
git clone https://github.com/trustedsec/pivoter.git

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

make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

