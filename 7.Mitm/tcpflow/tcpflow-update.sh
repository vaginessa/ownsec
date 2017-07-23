#!/bin/bash 

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ ____ ____  _____ _     _____        __
|_   _/ ___|  _ \|  ___| |   / _ \ \      / /
  | || |   | |_) | |_  | |  | | | \ \ /\ / / 
  | || |___|  __/|  _| | |__| |_| |\ V  V /  
  |_| \____|_|   |_|   |_____\___/  \_/\_/   
         
${normal}"


GITREPOROOT=/opt/ITSEC/7.Mitm/tcpflow/simsong/tcpflow
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=tcpflow
EXECUTEABLE2=tcpflow
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=tcpflow.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/tcpflow/simsong
cd /opt/ITSEC/7.Mitm/tcpflow/simsong
git clone https://github.com/simsong/tcpflow.git

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
sudo make uninstall
sudo rm /usr/local/bin/$EXECUTEABLE2
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
./bootstrap.bash
./configure
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi


