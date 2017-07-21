#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ ____ ___ _   _  ____ 
| | | |  _ \_ _| \ | |/ ___|
| |_| | |_) | ||  \| | |  _ 
|  _  |  __/| || |\  | |_| |
|_| |_|_|  |___|_| \_|\____|
            
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez
git clone https://github.com/antirez/hping.git


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/hping3/antirez/hping 
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=hping3.desktop

sudo rm /usr/sbin/hping
sudo rm /usr/sbin/hping2

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
sudo ln -s /usr/include/pcap/bpf.h /usr/include/net/bpf.h

./configure 
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL