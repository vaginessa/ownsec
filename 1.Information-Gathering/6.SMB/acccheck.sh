#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
    _    ____ ____ ____ _   _ _____ ____ _  __
   / \  / ___/ ___/ ___| | | | ____/ ___| |/ /
  / _ \| |  | |  | |   | |_| |  _|| |   | ' / 
 / ___ \ |__| |__| |___|  _  | |__| |___| . \ 
/_/   \_\____\____\____|_| |_|_____\____|_|\_\
            
${normal}"


mkdir -p /opt/ITSEC/1.Information-Gathering/6.SMB/accceck/labs.portcullis.co.uk

sudo udpatedb
sudo ldconfig

reporoot=/opt/ITSEC/1.Information-Gathering/6.SMB/accceck/labs.portcullis.co.uk
acccheck=acccheck-0-2-1
acccheckurl=https://labs.portcullis.co.uk/download/acccheck-0-2-1.tar.gz
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFL=acccheck.desktop



cd $reporoot
sudo rm -r /usr/local/bin/acccheck
sudo rm -r $reporoot/acccheck.sh

wget --no-check-certificate $acccheckurl
tar xvfz $acccheck.tar.gz
sudo rm -r $acccheck.tar.gz
cd $acccheck

chmod +x $reporoot/$acccheck/acccheck.pl
sudo ln -s $reporoot/$acccheck/acccheck.pl /usr/local/bin/acccheck
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
sudo updatedb



