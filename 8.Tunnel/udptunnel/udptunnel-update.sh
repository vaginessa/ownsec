#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ ____  ____ _____ _   _ _   _ _   _ _____ _     
| | | |  _ \|  _ \_   _| | | | \ | | \ | | ____| |    
| | | | | | | |_) || | | | | |  \| |  \| |  _| | |    
| |_| | |_| |  __/ | | | |_| | |\  | |\  | |___| |___ 
 \___/|____/|_|    |_|  \___/|_| \_|_| \_|_____|_____|
          
${normal}"

GITREPOROOT=/opt/ITSEC/8.Tunnel/udptunnel/astroza/udptunnel
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=udptunnel.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/8.Tunnel/udptunnel/astroza
cd /opt/ITSEC/8.Tunnel/udptunnel/astroza
git clone https://github.com/astroza/udptunnel.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

make -j 4

sudo rm -f /usr/local/bin/udptunnel
chmod +x client
sudo ln -s $GITREPOROOT/client /usr/local/bin/udptunnel
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi
