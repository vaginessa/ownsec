#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ _____ ____  ______   __
| \ | |  ___/ ___||  _ \ \ / /
|  \| | |_  \___ \| |_) \ V / 
| |\  |  _|  ___) |  __/ | |  
|_| \_|_|   |____/|_|    |_|  
        
${normal}"

GITREPOROOT=/opt/ITSEC/7.Mitm/nfspy/bonsaiviking/NfSpy
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=nfspy.desktop

if [ ! -d $GITREPOGITFILE ]

then


mkdir -p /opt/ITSEC/7.Mitm/nfspy/bonsaiviking
cd /opt/ITSEC/7.Mitm/nfspy/bonsaiviking
git clone https://github.com/bonsaiviking/NfSpy.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
sudo python setup.py install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

