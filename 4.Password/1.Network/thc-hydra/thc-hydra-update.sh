#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _   _  ____      _   ___   ______  ____      _    
|_   _| | | |/ ___|    | | | \ \ / /  _ \|  _ \    / \   
  | | | |_| | |   _____| |_| |\ V /| | | | |_) |  / _ \  
  | | |  _  | |__|_____|  _  | | | | |_| |  _ <  / ___ \ 
  |_| |_| |_|\____|    |_| |_| |_| |____/|_| \_\/_/   \_\
              
${normal}"


GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc/thc-hydra
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL1=hydra-gtk.desktop
DSKTPFL2=hydra.desktop

if [ ! -d $GITREPOGITFILE ]

then


mkdir -p /opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc
cd /opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc
git clone https://github.com/vanhauser-thc/thc-hydra.git

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

./configure
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2

cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2

fi
