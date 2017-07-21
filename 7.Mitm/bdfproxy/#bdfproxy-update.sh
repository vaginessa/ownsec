#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____  _____ ____  ____   _____  ____   __
| __ )|  _ \|  ___|  _ \|  _ \ / _ \ \/ /\ \ / /
|  _ \| | | | |_  | |_) | |_) | | | \  /  \ V / 
| |_) | |_| |  _| |  __/|  _ <| |_| /  \   | |  
|____/|____/|_|   |_|   |_| \_\\___/_/\_\  |_|  
       
${normal}"

GITREPOROOT=/opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel/BDFProxy
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=bdf_proxy.py
EXECUTEABLE2=bdfproxy
EXECUTEABLE3=wpBDF.sh
EXECUTEABLE4=wpBDF

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=bdfproxy.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel
cd /opt/ITSEC/7.Mitm/bdfproxy/secretsquirrel
git clone https://github.com/secretsquirrel/BDFProxy.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT

sudo rm /usr/local/bin/$EXECUTEABLE2
sudo rm /usr/local/bin/$EXECUTEABLE4

git clean -f 
git pull
git submodule init
git submodule update
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE4
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

