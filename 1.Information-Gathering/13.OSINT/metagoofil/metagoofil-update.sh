#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 __  __ _____ _____  _    ____  ___   ___  _____ ___ _     
|  \/  | ____|_   _|/ \  / ___|/ _ \ / _ \|  ___|_ _| |    
| |\/| |  _|   | | / _ \| |  _| | | | | | | |_   | || |    
| |  | | |___  | |/ ___ \ |_| | |_| | |_| |  _|  | || |___ 
|_|  |_|_____| |_/_/   \_\____|\___/ \___/|_|   |___|_____|
          
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk
cd /opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk
git clone https://github.com/opsdisk/metagoofil.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/metagoofil/opsdisk/metagoofil
EXECUTEABLE1=metagoofil.py
EXECUTEABLE2=metagoofil

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=metagoofil.desktop

sudo -H pip2 install google

cd $GITREPOROOT
sudo rm /usr/local/bin/$EXECUTEABLE2
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init  
git submodule update --recursive
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST  
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
