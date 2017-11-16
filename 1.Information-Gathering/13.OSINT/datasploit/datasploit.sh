#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____    _  _____  _    ____  ____  _     ___ ___ _____ 
|  _ \  / \|_   _|/ \  / ___||  _ \| |   / _ \_ _|_   _|
| | | |/ _ \ | | / _ \ \___ \| |_) | |  | | | | |  | |  
| |_| / ___ \| |/ ___ \ ___) |  __/| |__| |_| | |  | |  
|____/_/   \_\_/_/   \_\____/|_|   |_____\___/___| |_|  
                                                        
${normal}"

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=datasploit.desktop
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit/datasploit
EXECUTEABLE1=datasploit.py
EXECUTEABLE2=datasploit

mkdir -p /opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit
cd /opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit
git clone https://github.com/DataSploit/datasploit.git

cd /opt/ITSEC/1.Information-Gathering/13.OSINT/datasploit/DataSploit/datasploit

#git clean -f
#git fetch origin
#git reset --hard origin/master
#git pull
git submodule init  
git submodule update --recursive

sudo -H pip install -r requirements.txt
sudo updatedb
sudo ldconfig

mv config_sample.py config.py
# vim config.py

# python datasploit.py test.com

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST  
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL