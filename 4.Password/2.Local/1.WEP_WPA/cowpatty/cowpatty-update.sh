#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
  ____ _____        ______   _  _____ _______   __
 / ___/ _ \ \      / /  _ \ / \|_   _|_   _\ \ / /
| |  | | | \ \ /\ / /| |_) / _ \ | |   | |  \ V / 
| |__| |_| |\ V  V / |  __/ ___ \| |   | |   | |  
 \____\___/  \_/\_/  |_| /_/   \_\_|   |_|   |_|  
         
${normal}"

mkdir -p /opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx
cd /opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx
git clone https://github.com/roobixx/cowpatty.git

GITREPOROOT=/opt/ITSEC/4.Password/2.Local/1.WEP_WPA/cowpatty/roobixx/cowpatty
EXECUTEABLE1=cowpatty

DSKTPFLS=/opt/Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local/1.WEP_WPA
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/1.WEP_WPA
DSKTPFL=cowpatty.desktop

cd $GITREPOROOT
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull

make -j 4
sudo chmod +x $EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE1
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL