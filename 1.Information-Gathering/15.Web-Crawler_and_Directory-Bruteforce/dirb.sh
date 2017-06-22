#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/15.Web-Crawler_and_Directory-Bruteforce/dirb/seifreed
cd /opt/ITSEC/1.Information-Gathering/15.Web-Crawler_and_Directory-Bruteforce/dirb/seifreed
git clone https://github.com/seifreed/dirb.git


sudo updatedb
sudo ldconfig
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Web-Crawler_and_Directory-Bruteforce/dirb/seifreed/dirb

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/15.Web-Crawler_and_Directory-Bruteforce/
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Web-Crawler_and_Directory-Bruteforce
DSKTPFL=dirb.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ___ ____  ____  
|  _ \_ _|  _ \| __ ) 
| | | | || |_) |  _ \ 
| |_| | ||  _ <| |_) |
|____/___|_| \_\____/ 
        
${normal}"


cd $GITREPOROOT
#sudo rm  /usr/local/bin/$EXECUTEABLE2

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