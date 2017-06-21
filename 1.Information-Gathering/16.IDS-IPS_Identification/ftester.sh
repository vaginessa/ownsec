#!/bin/bash


mkdir -p /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath
cd /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath
git clone https://github.com/inversepath/ftester.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath/ftester
EXECUTEABLE1=ftest
EXECUTEABLE2=ftest
EXECUTEABLE3=ftestd
EXECUTEABLE4=ftestd
EXECUTEABLE5=freport
EXECUTEABLE6=freport
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification
DSKTPFL1=ftester.desktop
DSKTPFL2=ftestd.desktop
DSKTPFL3=freport.desktop

sudo rm /usr/local/bin/$EXECUTEABLE2
sudo rm /usr/local/bin/$EXECUTEABLE4
sudo rm /usr/local/bin/$EXECUTEABLE6

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE5
sudo ln -s $GITREPOROOT/$EXECUTEABLE5 /usr/local/bin/$EXECUTEABLE6
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
