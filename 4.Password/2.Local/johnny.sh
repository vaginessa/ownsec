#!/bin/bash

mkdir -p /opt/ITSEC/4.Password/2.Local/johnny/shinnok
cd /opt/ITSEC/4.Password/2.Local/johnny/shinnok
git clone https://github.com/shinnok/johnny.git

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johnny/shinnok/johnny
EXECUTEABLE1=johnny
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=johnny.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
     _  ___  _   _ _   _ _   ___   __
    | |/ _ \| | | | \ | | \ | \ \ / /
 _  | | | | | |_| |  \| |  \| |\ V / 
| |_| | |_| |  _  | |\  | |\  | | |  
 \___/ \___/|_| |_|_| \_|_| \_| |_|  
       
${normal}"


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
qmake && make -j$(nproc)
#
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE1
locate /usr/local/bin | grep $EXECUTEABLE1
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
