#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ __  __    _    ____  
| \ | |  \/  |  / \  |  _ \ 
|  \| | |\/| | / _ \ | |_) |
| |\  | |  | |/ ___ \|  __/ 
|_| \_|_|  |_/_/   \_\_|    
            
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap
cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap
git clone https://github.com/nmap/nmap.git

sudo updatedb
sudo ldconfig
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap/nmap
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL=nmap.desktop

cd $GITREPOROOT
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
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

