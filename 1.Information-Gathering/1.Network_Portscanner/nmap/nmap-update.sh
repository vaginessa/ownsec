#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ __  __    _    ____  
| \ | |  \/  |  / \  |  _ \ 
|  \| | |\/| | / _ \ | |_) |
| |\  | |  | |/ ___ \|  __/ 
|_| \_|_|  |_/_/   \_\_|    
            
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap/nmap
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL=nmap.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap
cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/nmap/nmap
git clone https://github.com/nmap/nmap.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

./configure
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

