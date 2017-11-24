#!/bin/bash
#sudo make install for bash completition not working

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/magnumripper/JohnTheRipper.git
BRANCH=bleeding-jumbo
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper
GITREPOBINDIR=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/run
EXECUTEABLE1=john.sh
EXECUTEABLE2=john
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=john.desktop
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
     _  ___  _   _ _   _ 
    | |/ _ \| | | | \ | |
 _  | | | | | |_| |  \| |
| |_| | |_| |  _  | |\  |
 \___/ \___/|_| |_|_| \_|
             
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
cd src
sudo make uninstall
make clean
cd $GITREPOROOT
GITSBMDLINIT
cd src

git clone --recursive https://github.com/teeshop/rexgen.git
cd rexgen
GITSBMDLINIT
sudo ./install.sh
cd $GITREPOROOT
cd src

./configure --enable-mpi
make -j 4
#sudo make install

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/run

./john "$@"' > $GITREPOBINDIR/$EXECUTEABLE1
chmod +x $GITREPOBINDIR/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOBINDIR/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

