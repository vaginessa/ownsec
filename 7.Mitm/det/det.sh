#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _____ _____ 
|  _ \| ____|_   _|
| | | |  _|   | |  
| |_| | |___  | |  
|____/|_____| |_|  
          
${normal}"


mkdir -p /opt/ITSEC/7.Mitm/det/sensepost
cd /opt/ITSEC/7.Mitm/det/sensepost
git clone https://github.com/sensepost/DET.git

GITREPOROOT=/opt/ITSEC/7.Mitm/det/sensepost/DET
EXECUTEABLE1=det.py
EXECUTEABLE2=det
EXECUTEABLE3=det.sh
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=det.desktop


sudo ldconfig
sudo updatedb

sudo rm /usr/local/bin/$EXECUTEABLE2
sudo rm $GITREPOROOT/$EXECUTEABLE3


cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
sudo -H pip2 install -r requirements.txt 

echo '#!/bin/bash -i 

cd /opt/ITSEC/7.Mitm/det/sensepost/DET
python det.py "$@"' > det.sh

chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
