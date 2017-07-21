#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__        _____  _          _____ 
\ \      / / _ \| |        | ____|
 \ \ /\ / / | | | |   _____|  _|  
  \ V  V /| |_| | |__|_____| |___ 
   \_/\_/  \___/|_____|    |_____|
            
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie
git clone git://git.kali.org/packages/wol-e.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie/wol-e
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=wol-e.desktop

EXECUTEABLE1=wol-e.py
EXECUTEABLE2=wol-e

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

#foreman s