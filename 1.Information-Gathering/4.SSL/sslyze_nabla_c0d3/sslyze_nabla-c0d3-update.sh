#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ____  _  __   ____________ 
/ ___/ ___|| | \ \ / /__  / ____|
\___ \___ \| |  \ V /  / /|  _|  
 ___) |__) | |___| |  / /_| |___ 
|____/____/|_____|_| /____|_____|
           
${normal}"

mkdir -p /opt/ITSEC/1.Information-Gathering/4.SSL/sslyze/nabla-c0d3
cd /opt/ITSEC/1.Information-Gathering/4.SSL/sslyze/nabla-c0d3
git clone https://github.com/nabla-c0d3/sslyze.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslyze/nabla-c0d3/sslyze
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/4.SSL
DSKTPFL=sslyze.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
sudo -H pip install -r requirements.txt

sudo python3 setup.py install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
