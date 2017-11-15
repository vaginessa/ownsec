#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ _______  _____  ____  ____    _    ____  _____ 
| | | | ____\ \/ / _ \|  _ \| __ )  / \  / ___|| ____|
| |_| |  _|  \  / | | | |_) |  _ \ / _ \ \___ \|  _|  
|  _  | |___ /  \ |_| |  _ <| |_) / ___ \ ___) | |___ 
|_| |_|_____/_/\_\___/|_| \_\____/_/   \_\____/|_____|
           
${normal}"

mkdir -p /opt/ITSEC/4.Password/1.Network/hexorbase/savio-code
cd /opt/ITSEC/4.Password/1.Network/hexorbase/savio-code
git clone https://github.com/savio-code/hexorbase.git

sudo rm -f /usr/local/bin/hexorbase

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase
GITREPOBINROOT=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase/HexorBase

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=hexorbase.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
cd $GITREPOBINROOT

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase/HexorBase

python execute.py "$@"' > hexorbase.sh

chmod +x hexorbase.sh

chmod +x execute.py
sudo rm -f /usr/local/bin/hexorbase
sudo ln -s /opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase/HexorBase/hexorbase.sh /usr/local/bin/hexorbase
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL


#wget 'http://download.oracle.com/otn/linux/instantclient/122010/instantclient-basic-linux.x64-12.2.0.1.0.zip' 

