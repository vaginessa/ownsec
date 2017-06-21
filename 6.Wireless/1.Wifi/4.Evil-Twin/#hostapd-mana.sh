#!/bin/bash

mkdir -p /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/3.Jammer/hostapd-mana/sensepost
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/3.Jammer/hostapd-mana/sensepost
git clone https://github.com/sensepost/hostapd-mana


GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-mana/sensepost/hostapd-mana
REPOBINDIR=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-mana/sensepost/hostapd-mana/hostapd
#

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git checkout hostapd-2.6
git pull
git submodule init && git submodule update --recursive
#
cd $REPOBINDIR

make clean
make -j 4
sudo make install