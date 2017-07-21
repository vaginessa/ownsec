#!/bin/bash
# needs makefile fix for pip "sudo -H pip install ..."

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
__        ___    _______        _____   ___  _____ 
\ \      / / \  |  ___\ \      / / _ \ / _ \|  ___|
 \ \ /\ / / _ \ | |_   \ \ /\ / / | | | | | | |_   
  \ V  V / ___ \|  _|   \ V  V /| |_| | |_| |  _|  
   \_/\_/_/   \_\_|      \_/\_/  \___/ \___/|_|    
       
${normal}"


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/1.Web-Firewalls/wafw00f/EnableSecurity/wafw00f
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification/1.Web-Firewalls
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification/1.Web-Firewalls
DSKTPFL=wafw00f.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/1.Web-Firewalls/wafw00f/EnableSecurity
cd /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/1.Web-Firewalls/wafw00f/EnableSecurity
git clone https://github.com/EnableSecurity/wafw00f.git

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
git pull
git submodule init  
git submodule update --recursive
sed -i -e 's/pip install/sudo -H pip install/g' Makefile
make -j 4
sudo python setup.py install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi