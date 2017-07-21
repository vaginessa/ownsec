#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ ____  _     ____ ____      _     _______   __
| | | |  _ \| |   / ___|  _ \    / \   |__  /\ \ / /
| | | | |_) | |  | |   | |_) |  / _ \    / /  \ V / 
| |_| |  _ <| |__| |___|  _ <  / ___ \  / /_   | |  
 \___/|_| \_\_____\____|_| \_\/_/   \_\/____|  |_|  
               
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker
cd /opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker
git clone https://github.com/hardwaterhacker/URLCrazy.git


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker/URLCrazy
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=urlcrazy
EXECUTEABLE2=urlcrazy
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=urlcrazy.desktop

cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL