#!/bin/bash
mkdir -p /opt/ITSEC-Install-Scripts/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m
cd /opt/ITSEC-Install-Scripts/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m
git clone https://github.com/steve-m/kalibrate-rtl

GITREPOGITFILE=$GITREPOROOT/.git

cd /opt/ITSEC/6.Wireless/4.Sdr/1.GSM/kalibrate-rtl/steve-m/kalibrate-rtl
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
./bootstrap
./configure
make -j 2
sudo make install