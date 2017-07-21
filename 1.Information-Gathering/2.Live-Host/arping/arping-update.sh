#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
    _    ____  ____ ___ _   _  ____ 
   / \  |  _ \|  _ \_ _| \ | |/ ___|
  / _ \ | |_) | |_) | ||  \| | |  _ 
 / ___ \|  _ <|  __/| || |\  | |_| |
/_/   \_\_| \_\_|  |___|_| \_|\____|
         
${normal}"


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets/arping
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=arping.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets
git clone https://github.com/ThomasHabets/arping.git

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
git submodule init
git submodule update --recursive

./bootstrap.sh
./configure
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
fi
