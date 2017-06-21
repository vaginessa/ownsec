#!/bin/sh

mkdir -p /opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc
cd /opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc
git clone https://github.com/vanhauser-thc/thc-hydra.git

sudo updatedb
sudo ldconfig
#
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/thc-hydra/vanhauser-thc/thc-hydra
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL1=hydra-gtk.desktop
DSKTPFL2=hydra.desktop

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
./configure
make -j 4
sudo make install
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2