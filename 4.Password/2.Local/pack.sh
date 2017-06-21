#!/bin/sh

mkdir -p /opt/ITSEC/4.Password/2.Local/pack/iphelix
cd /opt/ITSEC/4.Password/2.Local/pack/iphelix
git clone https://github.com/iphelix/pack.git

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/pack/iphelix/pack 
EXECUTEABLE1=maskgen.py
EXECUTEABLE2=pack_maskgen
EXECUTEABLE3=policygen.py
EXECUTEABLE4=pack_poplicygen
EXECUTEABLE5=rulegen.py
EXECUTEABLE6=pack_rulegen
EXECUTEABLE7=statsgen.py
EXECUTEABLE8=pack_statsgen
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local/pack
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/pack
DSKTPFL1=pack_maskgen.desktop
DSKTPFL2=pack_policygen.desktop
DSKTPFL3=pack_rulegen.desktop
DSKTPFL4=pack_statsgen.desktop


cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo rm -f /usr/local/bin/$EXECUTEABLE4
sudo rm -f /usr/local/bin/$EXECUTEABLE6
sudo rm -f /usr/local/bin/$EXECUTEABLE8
sudo rm -f /usr/local/bin/maskgen
sudo rm -f /usr/local/bin/poplicygen
sudo rm -f /usr/local/bin/rulegen
sudo rm -f /usr/local/bin/statsgen
#
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
#
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE5
sudo ln -s $GITREPOROOT/$EXECUTEABLE5 /usr/local/bin/$EXECUTEABLE6
chmod +x $GITREPOROOT/$EXECUTEABLE7
sudo ln -s $GITREPOROOT/$EXECUTEABLE7 /usr/local/bin/$EXECUTEABLE8
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
mkdir -p $DSKTPFLSDEST
 cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL4 $DSKTPFLSDEST/$DSKTPFL4

