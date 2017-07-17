#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ _____ ___  _   _ _____ _____ 
| | | |  ___/ _ \| \ | | ____|_   _|
| | | | |_ | | | |  \| |  _|   | |  
| |_| |  _|| |_| | |\  | |___  | |  
 \___/|_|   \___/|_| \_|_____| |_|  
           
${normal}"

mkdir -p /opt/ITSEC/10.Stresstest/ufonet/epsylon
cd /opt/ITSEC/10.Stresstest/ufonet/epsylon
git clone https://github.com/epsylon/ufonet

GITREPOROOT=/opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
EXECUTEABLE1=ufonet
EXECUTEABLE2=ufonet.sh

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=ufonet.desktop

cd $GITREPOROOT
sudo rm  /usr/local/bin/$EXECUTEABLE1
sudo updatedb
sudo ldconfig
git clean -f 
git pull
git submodule init && git submodule update --recursive

#sudo python setup.py install

echo '#!/bin/bash
cd /opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
./ufonet "$@"' > ufonet.sh
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE1
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
