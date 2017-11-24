#!/bin/bash
#doesent work

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/rafael-santiago/pig
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/pig/rafael-santiago/pig
GITCLONEDIR=/opt/ITSEC/10.Stresstest/pig/rafael-santiago
#EXECUTEABLE1=pig.py
#EXECUTEABLE2=dhcpPIG
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____ ___ ____ 
|  _ \_ _/ ___|
| |_) | | |  _ 
|  __/| | |_| |
|_|  |___\____|
              
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT
GITSBMDLINIT

git clone https://github.com/rafael-santiago/hefesto

cd hefesto
GITSBMDLINIT
cd /opt/ITSEC/10.Stresstest/pig/rafael-santiago/pig/hefesto/src/

./build.sh
#chmod +x $GITREPOROOT/$EXECUTEABLE1
#sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
