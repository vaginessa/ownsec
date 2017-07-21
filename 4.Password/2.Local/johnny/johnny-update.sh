#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
     _  ___  _   _ _   _ _   ___   __
    | |/ _ \| | | | \ | | \ | \ \ / /
 _  | | | | | |_| |  \| |  \| |\ V / 
| |_| | |_| |  _  | |\  | |\  | | |  
 \___/ \___/|_| |_|_| \_|_| \_| |_|  
       
${normal}"

GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johnny/shinnok/johnny
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=johnny

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=johnny.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/4.Password/2.Local/johnny/shinnok
cd /opt/ITSEC/4.Password/2.Local/johnny/shinnok
git clone https://github.com/shinnok/johnny.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
sudo rm -r /usr/local/bin/johnny
sudo updatedb
sudo ldconfig
git clean -f
git pull
git submodule init
git submodule update --recursive
#
export QT_SELECT=qt5
qmake
make -j$(nproc)

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE1
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

