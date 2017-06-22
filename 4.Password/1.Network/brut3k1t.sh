#!/bin/bash

mkdir -p /opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x
cd /opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x
git clone https://github.com/ex0dus-0x/brut3k1t.git

sudo -H pip2 install asn1crypto
sudo updatedb
sudo ldconfig
#
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network/
DSKTPFLSDEST=/home/$USER/.local/share/applications/applications/4.Password/1.Network
DSKTPFL=brut3k1t.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____  _   _ _____ _____ _  ___ _____ 
| __ )|  _ \| | | |_   _|___ /| |/ / |_   _|
|  _ \| |_) | | | | | |   |_ \| ' /| | | |  
| |_) |  _ <| |_| | | |  ___) | . \| | | |  
|____/|_| \_\\___/  |_| |____/|_|\_\_| |_|  
          
${normal}"

cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#
sudo -H pip2 install -r requirements.txt

echo "#!/bin/bash
cd /opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t
./brut3k1t" > brut3k1t.sh
chmod +x brut3k1t.sh
sudo ln -s /opt/ITSEC/4.Password/1.Network/brut3k1t/ex0dus-0x/brut3k1t/brut3k1t.sh /usr/local/bin/brut3k1t
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
