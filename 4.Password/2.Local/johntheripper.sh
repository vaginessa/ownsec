#!/bin/bash
#sudo make install for bash completition not working


mkdir -p /opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper
cd /opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper
git clone https://github.com/magnumripper/JohnTheRipper.git

sudo updatedb
sudo ldconfig
#
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper
binarydir=/opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/run
mainexec=john
exec2=john.sh

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=john.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
     _  ___  _   _ _   _ 
    | |/ _ \| | | | \ | |
 _  | | | | | |_| |  \| |
| |_| | |_| |  _  | |\  |
 \___/ \___/|_| |_|_| \_|
             
${normal}"


cd $GITREPOROOT
cd src
sudo make uninstall
make clean
cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/bleeding-jumbo
git pull
git submodule init
git submodule update --recursive
cd src
#
git clone --recursive https://github.com/teeshop/rexgen.git
cd rexgen
sudo ./install.sh
cd $GITREPOROOT
cd src
./configure --enable-mpi
make -j 4
#sudo make install

echo "#!/bin/bash

cd /opt/ITSEC/4.Password/2.Local/johntheripper/magnumripper/JohnTheRipper/run

./john" > $binarydir/$exec2
chmod +x $binarydir/$exec2
sudo ln -s $binarydir/$exec2 /usr/local/bin/$mainexec
locate /usr/local/bin | grep $mainexec
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

