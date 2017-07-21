#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ___ ___  ____ ___ _   _ _____ 
|_ _/ _ \|  _ \_ _| \ | | ____|
 | | | | | | | | ||  \| |  _|  
 | | |_| | |_| | || |\  | |___ 
|___\___/|____/___|_| \_|_____|
               
${normal}"

GITREPOROOT=/opt/ITSEC/8.Tunnel/iodine/yarrick/iodine
GITREPOGITFILE=$GITREPOROOT/.git

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=iodine.desktop

if [ ! -d $GITREPOGITFILE ]

then


mkdir -p /opt/ITSEC/8.Tunnel/iodine/yarrick
cd /opt/ITSEC/8.Tunnel/iodine/yarrick
git clone https://github.com/yarrick/iodine.git

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
#
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

