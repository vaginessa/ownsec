#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg
cd /opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg
git clone https://github.com/mteg/braa.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg/braa
EXECUTEABLE1=braa
EXECUTEABLE2=braa
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/8.SNMP
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/8.SNMP
DSKTPFL=braa.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____      _        _    
| __ )|  _ \    / \      / \   
|  _ \| |_) |  / _ \    / _ \  
| |_) |  _ <  / ___ \  / ___ \ 
|____/|_| \_\/_/   \_\/_/   \_\
        
${normal}"


cd $GITREPOROOT
sudo rm /usr/local/bin/$EXECUTEABLE2

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init  
git submodule update --recursive
make -j 4
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL