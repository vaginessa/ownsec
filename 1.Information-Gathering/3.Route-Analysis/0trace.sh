#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch
cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch
git clone https://github.com/BlackArch/0trace.git

sudo rm -f  /usr/local/bin/0trace

sudo -H pip2 install pydnet
sudo -H pip2 install dpkt
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFL=0trace.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
  ___ _____ ____      _    ____ _____ 
 / _ \_   _|  _ \    / \  / ___| ____|
| | | || | | |_) |  / _ \| |   |  _|  
| |_| || | |  _ <  / ___ \ |___| |___ 
 \___/ |_| |_| \_\/_/   \_\____|_____|
             
${normal}"


cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch/0trace
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#sudo ln -s /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch/0trace/0trace.py /usr/local/bin/0trace

chmod +x /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch/0trace/0trace.py
sudo ln -s /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/0trace/BlackArch/0trace/0trace.py /usr/local/bin/0trace

sudo updatedb
mkdir -p $DSKTPFLSDEST  
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


