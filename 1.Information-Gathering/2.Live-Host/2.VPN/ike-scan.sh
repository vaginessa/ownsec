#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ___ _  _______     ____   ____    _    _   _ 
|_ _| |/ / ____|   / ___| / ___|  / \  | \ | |
 | || ' /|  _| ____\___ \| |     / _ \ |  \| |
 | || . \| |__|_____|__) | |___ / ___ \| |\  |
|___|_|\_\_____|   |____/ \____/_/   \_\_| \_|
   
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan/royhills
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan/royhills
git clone https://github.com/royhills/ike-scan.git

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host/2.VPN
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/2.VPN
DSKTPFL=ike-scan.desktop

cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/2.VPN/ike-scan/royhills/ike-scan
make clean
sudo ldconfig
sudo updatedb
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
autoreconf --install
./configure --with-openssl
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
sudo ldconfig
sudo updatedb