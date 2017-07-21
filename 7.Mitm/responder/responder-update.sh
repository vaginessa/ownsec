#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _____ ____  ____   ___  _   _ ____  _____ ____  
|  _ \| ____/ ___||  _ \ / _ \| \ | |  _ \| ____|  _ \ 
| |_) |  _| \___ \| |_) | | | |  \| | | | |  _| | |_) |
|  _ <| |___ ___) |  __/| |_| | |\  | |_| | |___|  _ < 
|_| \_\_____|____/|_|    \___/|_| \_|____/|_____|_| \_\
           
${normal}"

GITREPOROOT=/opt/ITSEC/7.Mitm/responder/SpiderLabs/Responder
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=Responder.py

EXECUTEABLE2=responder
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=responder.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/responder/SpiderLabs
cd /opt/ITSEC/7.Mitm/responder/SpiderLabs
git clone https://github.com/SpiderLabs/Responder.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2

sudo updatedb
sudo ldconfig
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi


