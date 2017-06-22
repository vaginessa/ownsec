#!/bin/bash

mkdir -p /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat
cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat
git clone https://github.com/hashcat/hashcat.git
#

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=hashcat.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _    _    ____  _   _  ____    _  _____ 
| | | |  / \  / ___|| | | |/ ___|  / \|_   _|
| |_| | / _ \ \___ \| |_| | |     / _ \ | |  
|  _  |/ ___ \ ___) |  _  | |___ / ___ \| |  
|_| |_/_/   \_\____/|_| |_|\____/_/   \_\_|  
               
${normal}"

cd $GITREPOROOT

make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule update --init

##
cd $GITREPOROOT
git clone https://github.com/hashcat/hashcat-utils



cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/hashcat-utils
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
cd src
make -j 4

##

cd $GITREPOROOT
git clone https://github.com/hashcat/maskprocessor



cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/maskprocessor
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
cd src
make -j 4
sudo make install

##

cd $GITREPOROOT
git clone https://github.com/hashcat/statsprocessor


cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/statsprocessor
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
cd src
make -j 4
sudo make install


#
cd $GITREPOROOT
git clone https://github.com/hashcat/princeprocessor

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/princeprocessor
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
cd src
make -j 4
sudo make install

##

cd $GITREPOROOT

make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
