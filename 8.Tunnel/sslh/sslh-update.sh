#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ____  _     _   _ 
/ ___/ ___|| |   | | | |
\___ \___ \| |   | |_| |
 ___) |__) | |___|  _  |
|____/____/|_____|_| |_|
            
${normal}"

GITREPOROOT=/opt/ITSEC/8.Tunnel/sslh/yrutschle/sslh
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFLSDEST=/home/$USER/.local/share/applications
DSKTPFL=sslh.desktop


if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/8.Tunnel/sslh/yrutschle
cd /opt/ITSEC/8.Tunnel/sslh/yrutschle
git clone https://github.com/yrutschle/sslh.git

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

