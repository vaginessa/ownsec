#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=git clone https://github.com/hashcat/hashcat.git
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=hashcat.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _    _    ____  _   _  ____    _  _____ 
| | | |  / \  / ___|| | | |/ ___|  / \|_   _|
| |_| | / _ \ \___ \| |_| | |     / _ \ | |  
|  _  |/ ___ \ ___) |  _  | |___ / ___ \| |  
|_| |_/_/   \_\____/|_| |_|\____/_/   \_\_|  
            
INSTALL   
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

cd $GITREPOROOT

make clean
GITSBMDLINIT

cd $GITREPOROOT
git clone https://github.com/hashcat/hashcat-utils

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/hashcat-utils
make clean
GITSBMDLINIT
cd src
make -j 4

cd $GITREPOROOT
git clone https://github.com/hashcat/maskprocessor
cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/maskprocessor
make clean
GITSBMDLINIT
cd src
make -j 4
sudo make install

cd $GITREPOROOT
git clone https://github.com/hashcat/statsprocessor
cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/statsprocessor
make clean
GITSBMDLINIT
cd src
make -j 4
sudo make install

cd $GITREPOROOT
git clone https://github.com/hashcat/princeprocessor

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/princeprocessor
GITSBMDLINIT
cd src
make -j 4
sudo make install

cd $GITREPOROOT
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
