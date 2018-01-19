#!/bin/bash

GITREPO=https://github.com/sensepost/hostapd-mana
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-mana/sensepost/hostapd-mana
GITCLONEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/3.Jammer/hostapd-mana/sensepost
REPOBINDIR=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-mana/sensepost/hostapd-mana/hostapd
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

#plh11
GITSBMDLINIT
cd $REPOBINDIR

make clean
make -j 4
sudo make install



