#!/bin/bash

GITREPO=https://github.com/sensepost/hostapd-mana
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-mana/sensepost/hostapd-mana
GITCLONEDIR=/opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/3.Jammer/hostapd-mana/sensepost
REPOBINDIR=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-mana/sensepost/hostapd-mana/hostapd
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
GITSBMDLINIT
cd $REPOBINDIR

make clean
make -j 4
sudo make install



