#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ___ _   _ ____  __  ____   ___   _    _    ____  _   _ 
|  ___|_ _| \ | |  _ \|  \/  \ \ / / | | |  / \  / ___|| | | |
| |_   | ||  \| | | | | |\/| |\ V /| |_| | / _ \ \___ \| |_| |
|  _|  | || |\  | |_| | |  | | | | |  _  |/ ___ \ ___) |  _  |
|_|   |___|_| \_|____/|_|  |_| |_| |_| |_/_/   \_\____/|_| |_|
           
${normal}"

mkdir -p /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn
cd /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn
git clone https://github.com/frdmn/findmyhash.git

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network/
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=findmyhash.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash

python findmyhash.py "$@"' > findmyhash.sh
chmod +x findmyhash.sh
sudo rm -f /usr/local/bin/findmyhash
sudo ln -s /opt/ITSEC/4.Password/1.Network/findmyhash/frdmn/findmyhash/findmyhash.sh /usr/local/bin/findmyhash
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL