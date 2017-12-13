#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/zmap/zmap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap/zmap
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap/zmap/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/zmap/zmap
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL=zmap.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}

echo "${bold}
 _______  __    _    ____  
|__  /  \/  |  / \  |  _ \ 
  / /| |\/| | / _ \ | |_) |
 / /_| |  | |/ ___ \|  __/ 
/____|_|  |_/_/   \_\_|    
            
UPDATE CHECK
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout $BRANCH &&
    git fetch origin $BRANCH &&
    [ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
    git merge origin/$BRANCH
then
    
cd $GITREPOROOT

cd build
make clean
cd $GITREPOROOT
rm -f build
GITRESET
GITSBMDLINIT

mkdir build
cd build
cmake ..
make -j 4
sudo make install

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


