#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ____  _     ____  ____  _     ___ _____ 
/ ___/ ___|| |   / ___||  _ \| |   |_ _|_   _|
\___ \___ \| |   \___ \| |_) | |    | |  | |  
 ___) |__) | |___ ___) |  __/| |___ | |  | |  
|____/____/|_____|____/|_|   |_____|___| |_|  
             
${normal}"


GITREPOROOT=/opt/ITSEC/7.Mitm/sslsplit/droe/sslsplit
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=sslsplit.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/sslsplit/droe
cd /opt/ITSEC/7.Mitm/sslsplit/droe
git clone https://github.com/droe/sslsplit.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else



cd $GITREPOROOT
sudo make uninstall
sudo updatedb
sudo ldconfig
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

