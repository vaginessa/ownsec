#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _    _    ____  _   _  ____    _  _____ 
| | | |  / \  / ___|| | | |/ ___|  / \|_   _|
| |_| | / _ \ \___ \| |_| | |     / _ \ | |  
|  _  |/ ___ \ ___) |  _  | |___ / ___ \| |  
|_| |_/_/   \_\____/|_| |_|\____/_/   \_\_|  
               
${normal}"

GITREPOROOT=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=hashcat.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat
cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat
git clone https://github.com/hashcat/hashcat.git

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
git submodule update --init

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

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/maskprocessor
sudo make uninstall
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

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/statsprocessor
sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
cd src
make -j 4
sudo make install


#
cd $GITREPOROOT

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/princeprocessor
sudo make uninstall
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
make -j 4
sudo make install
sudo rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi


