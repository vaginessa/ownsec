#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____   _____  ____   ______ _   _    _    ___ _   _ ____  _  _   
|  _ \|  _ \ / _ \ \/ /\ \ / / ___| | | |  / \  |_ _| \ | / ___|| || |  
| |_) | |_) | | | \  /  \ V / |   | |_| | / _ \  | ||  \| \___ \| || |_ 
|  __/|  _ <| |_| /  \   | || |___|  _  |/ ___ \ | || |\  |___) |__   _|
|_|   |_| \_\\___/_/\_\  |_| \____|_| |_/_/   \_\___|_| \_|____/   |_|  
        
${normal}"

mkdir -p /opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r
cd /opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r
git clone https://github.com/rofl0r/proxychains-ng

GITREPOROOT=/opt/ITSEC/8.Tunnel/proxychains-ng/rofl0r/proxychains-ng
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=proxychains-ng.desktop

cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
./configure
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
