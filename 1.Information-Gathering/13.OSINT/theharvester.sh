#!/bin/bash


mkdir -p /opt/ITSEC/1.Information-Gathering/13.OSINT/theharvester/laramies
cd /opt/ITSEC/1.Information-Gathering/13.OSINT/theharvester/laramies
git clone https://github.com/laramies/theHarvester.git

sudo updatedb
sudo ldconfig
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/theharvester/laramies/theHarvester
EXECUTEABLE1=theHarvester.py
EXECUTEABLE2=theharvester
EXECUTEABLE3=myparser.py
EXECUTEABLE4=myparser

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=theharvester.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _   _ _____ _   _    _    ______     _______ ____ _____ _____ ____  
|_   _| | | | ____| | | |  / \  |  _ \ \   / / ____/ ___|_   _| ____|  _ \ 
  | | | |_| |  _| | |_| | / _ \ | |_) \ \ / /|  _| \___ \ | | |  _| | |_) |
  | | |  _  | |___|  _  |/ ___ \|  _ < \ V / | |___ ___) || | | |___|  _ < 
  |_| |_| |_|_____|_| |_/_/   \_\_| \_\ \_/  |_____|____/ |_| |_____|_| \_\
    
${normal}"


cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
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
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL