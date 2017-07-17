#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__        _______ ____    _    ____ ___   ___  
\ \      / / ____| __ )  / \  / ___/ _ \ / _ \ 
 \ \ /\ / /|  _| |  _ \ / _ \| |  | | | | | | |
  \ V  V / | |___| |_) / ___ \ |__| |_| | |_| |
   \_/\_/  |_____|____/_/   \_\____\___/ \___/ 
          
${normal}"

mkdir -p /opt/ITSEC/9.Maintain-Access/2.Generate/webacoo/anestisb
cd /opt/ITSEC/9.Maintain-Access/2.Generate/webacoo/anestisb
git clone https://github.com/anestisb/WeBaCoo

GITREPOROOT=/opt/ITSEC/9.Maintain-Access/2.Generate/webacoo/anestisb/WeBaCoo/

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFL=webacoo.desktop

cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

sudo rm -f /usr/local/bin/webacoo
chmod +x webacoo.pl
sudo ln -s /opt/ITSEC/9.Maintain-Access/2.Generate/webacoo/anestisb/WeBaCoo/webacoo.pl /usr/local/bin/webacoo
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
