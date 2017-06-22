#!/bin/bash
#DEPENDS HASHCAT


mkdir -p /opt/ITSEC/4.Password/2.Local/rainbowcrack/kholia
cd /opt/ITSEC/4.Password/2.Local/rainbowcrack/kholia
git clone https://github.com/kholia/rainbowcrack-ng.git

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/rainbowcrack/kholia/rainbowcrack-ng/src
EXECUTEABLE1=rcrack
EXECUTEABLE2=rainbowcrack-ng_rcrack
EXECUTEABLE3=rtdump
EXECUTEABLE4=rainbowcrack-ng_rtdump
EXECUTEABLE5=rtgen
EXECUTEABLE6=rainbowcrack-ng_rtgen
EXECUTEABLE7=rtsort
EXECUTEABLE8=rainbowcrack-ng_rtsort

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL1=rainbowcrack-ng_rcrack.desktop

sudo rm /usr/local/bin/$EXECUTEABLE2
sudo rm /usr/local/bin/$EXECUTEABLE4
sudo rm /usr/local/bin/$EXECUTEABLE6
sudo rm /usr/local/bin/$EXECUTEABLE8

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____      _    ___ _   _ ____   _____        ______ ____      _    ____ _  __
|  _ \    / \  |_ _| \ | | __ ) / _ \ \      / / ___|  _ \    / \  / ___| |/ /
| |_) |  / _ \  | ||  \| |  _ \| | | \ \ /\ / / |   | |_) |  / _ \| |   | ' / 
|  _ <  / ___ \ | || |\  | |_) | |_| |\ V  V /| |___|  _ <  / ___ \ |___| . \ 
|_| \_\/_/   \_\___|_| \_|____/ \___/  \_/\_/  \____|_| \_\/_/   \_\____|_|\_\
           
${normal}"

cd $GITREPOROOT
make clean
cd ..
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
cd src
#
make -j 4 
#sudo make install

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE5
sudo ln -s $GITREPOROOT/$EXECUTEABLE5 /usr/local/bin/$EXECUTEABLE6
chmod +x $GITREPOROOT/$EXECUTEABLE7
sudo ln -s $GITREPOROOT/$EXECUTEABLE7 /usr/local/bin/$EXECUTEABLE8

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL4 $DSKTPFLSDEST/$DSKTPFL4