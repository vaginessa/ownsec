#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _   _  ____     ___ ______     ____   
|_   _| | | |/ ___|   |_ _|  _ \ \   / / /_  
  | | | |_| | |   _____| || |_) \ \ / / '_ \ 
  | | |  _  | |__|_____| ||  __/ \ V /| (_) |
  |_| |_| |_|\____|   |___|_|     \_/  \___/ 
       
${normal}"


mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc
git clone https://github.com/vanhauser-thc/thc-ipv6.git


DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host/3.IPv6
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/3.IPv6
DSKTPFL=thcping6.desktop


cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/3.IPv6/thc-ipv6/vanhauser-thc/thc-ipv6
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
sudo ldconfig
sudo updatedb
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
thc-ipv6-setup.sh