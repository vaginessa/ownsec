#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _______  __    _    ____  
|__  /  \/  |  / \  |  _ \ 
  / /| |\/| | / _ \ | |_) |
 / /_| |  | |/ ___ \|  __/ 
/____|_|  |_/_/   \_\_|    
            
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap
cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap
git clone https://github.com/zmap/zmap.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap/zmap
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL=zmap.desktop

sudo ldconfig
sudo updatedb

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
mkdir build
cd build
cmake ..
make -j 4
sudo make install 
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
