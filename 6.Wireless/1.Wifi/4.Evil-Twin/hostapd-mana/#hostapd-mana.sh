#!/bin/bash


GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-mana/sensepost/hostapd-mana
GITREPOGITFILE=$GITREPOROOT/.git
REPOBINDIR=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-mana/sensepost/hostapd-mana/hostapd

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/3.Jammer/hostapd-mana/sensepost
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/3.Jammer/hostapd-mana/sensepost
git clone https://github.com/sensepost/hostapd-mana
else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


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

fi
