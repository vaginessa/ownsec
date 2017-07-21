#!/bin/bash

mkdir -p /opt/ITSEC-Install-Scripts/6.Wireless/4.Sdr/1.GSM/3.Jammer/gr-gsm/ptrkrysik
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/4.Sdr/1.GSM/gr-gsm/ptrkrysik
git clone https://github.com/ptrkrysik/gr-gsm


GITREPOROOT=/opt/ITSEC/6.Wireless/4.Sdr/1.GSM/gr-gsm/ptrkrysik/gr-gsm
GITREPOGITFILE=$GITREPOROOT/.git

cd $GITREPOROOT
sudo rm -r build
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive
#
mkdir build
cd build
cmake ..
make -j 4
sudo make install 