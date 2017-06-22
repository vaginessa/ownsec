#!/bin/bash

mkdir -p /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject
cd /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject
git clone https://github.com/sqlmapproject/sqlmap.git

sudo ldconfig
sudo updatedb
#
sudo rm /usr/local/bin/sqlmapapi
sudo rm /usr/local/bin/sqlmap
#	
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/5.Database/1.SQL
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL
DSKTPFL=sqlmap.desktop


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____   ___  _     __  __    _    ____  
/ ___| / _ \| |   |  \/  |  / \  |  _ \ 
\___ \| | | | |   | |\/| | / _ \ | |_) |
 ___) | |_| | |___| |  | |/ ___ \|  __/ 
|____/ \__\_\_____|_|  |_/_/   \_\_|    
              
${normal}"


cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init git submodule update --recursive
#
sudo ln -s /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap/sqlmap.py /usr/local/bin/sqlmap
sudo ln -s /opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap/sqlmapapi.py /usr/local/bin/sqlmapapi
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL