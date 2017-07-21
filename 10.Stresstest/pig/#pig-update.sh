#!/bin/bash
#doesent work

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ___ ____ 
|  _ \_ _/ ___|
| |_) | | |  _ 
|  __/| | |_| |
|_|  |___\____|
              
${normal}"

GITREPOROOT=/opt/ITSEC/10.Stresstest/pig/rafael-santiago/pig
GITREPOGITFILE=$GITREPOROOT/.git
#EXECUTEABLE1=pig.py
#EXECUTEABLE2=dhcpPIG

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/10.Stresstest/pig/rafael-santiago
cd /opt/ITSEC/10.Stresstest/pig/rafael-santiago
git clone https://github.com/rafael-santiago/pig

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
#sudo rm  /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f 
git pull
git submodule init && git submodule update --recursive

git clone https://github.com/rafael-santiago/hefesto

cd hefesto
git clean -f 
git pull
git submodule init && git submodule update --recursive
cd /opt/ITSEC/10.Stresstest/pig/rafael-santiago/pig/hefesto/src/

./build.sh
#chmod +x $GITREPOROOT/$EXECUTEABLE1
#sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

fi

