#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  __  __ ___ _____ ______   __
|  _ \|  \/  |_ _|_   _|  _ \ \ / /
| | | | |\/| || |  | | | |_) \ V / 
| |_| | |  | || |  | | |  _ < | |  
|____/|_|  |_|___| |_| |_| \_\|_|  
            
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86
git clone https://github.com/jaygreig86/dmitry.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/dmitry/jaygreig86/dmitry

EXECUTEABLE1=dmitry
EXECUTEABLE2=dmitry

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=dmitry.desktop

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

chmod +x configure
chmod +x bootstrap
./bootstrap
./configure
make -j 4

sudo rm /usr/local/bin/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL