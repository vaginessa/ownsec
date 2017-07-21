#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ___ ____  ____  
|  _ \_ _|  _ \| __ ) 
| | | | || |_) |  _ \ 
| |_| | ||  _ <| |_) |
|____/___|_| \_\____/ 
        
${normal}"


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed/dirb
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/15.Fuzzer/
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer
DSKTPFL=dirb.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/dirb/seifreed
git clone https://github.com/seifreed/dirb.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
#sudo rm  /usr/local/bin/$EXECUTEABLE2

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive

./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi