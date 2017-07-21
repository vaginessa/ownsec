#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ______        ___   _    _  _____ 
|  _ \ \      / / \ | |  / \|_   _|
| |_) \ \ /\ / /|  \| | / _ \ | |  
|  __/ \ V  V / | |\  |/ ___ \| |  
|_|     \_/\_/  |_| \_/_/   \_\_|  
             
${normal}"

GITREPOROOT=/opt/ITSEC/8.Tunnel/pwnat/samyk/pwnat
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=pwnat	
EXECUTEABLE2=pwnat

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=pwnat.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/8.Tunnel/pwnat/samyk
cd /opt/ITSEC/8.Tunnel/pwnat/samyk
git clone https://github.com/samyk/pwnat.git

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
#
make -j 4

#sudo make install doesent work
#
sudo rm -f /usr/local/bin/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

