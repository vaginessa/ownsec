#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _____ _____ _____ ____   ____    _    ____  
| ____|_   _|_   _| ____|  _ \ / ___|  / \  |  _ \ 
|  _|   | |   | | |  _| | |_) | |     / _ \ | |_) |
| |___  | |   | | | |___|  _ <| |___ / ___ \|  __/ 
|_____| |_|   |_| |_____|_| \_\\____/_/   \_\_|    
            
${normal}"

GITREPOROOT=/opt/ITSEC/7.Mitm/ettercap/Ettercap/ettercap
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=ettercap.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/ettercap/Ettercap
cd /opt/ITSEC/7.Mitm/ettercap/Ettercap
git clone https://github.com/Ettercap/ettercap.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

sudo updatedb
sudo ldconfig

cd $GITREPOROOT
cd build
sudo make uninstall
cd $GITREPOROOT
cd build 
sudo make uninstall
cd $GITREPOROOT
sudo rm -r build
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

mkdir build
cd build
cmake ../
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
rm -f $DSKTPFLSDEST/$DSKTPFL

fi

