#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/hashcat/hashcat.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL=hashcat.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _    _    ____  _   _  ____    _  _____ 
| | | |  / \  / ___|| | | |/ ___|  / \|_   _|
| |_| | / _ \ \___ \| |_| | |     / _ \ | |  
|  _  |/ ___ \ ___) |  _  | |___ / ___ \| |  
|_| |_/_/   \_\____/|_| |_|\____/_/   \_\_|  
            
UPDATE   
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
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT

cd $GITREPOROOT
git clone https://github.com/hashcat/hashcat-utils

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/hashcat-utils
make clean
GITRESET
GITSBMDLINIT
cd src
make -j 4
cd $GITREPOROOT

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/maskprocessor
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT
cd src
make -j 4
sudo make install
cd $GITREPOROOT

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/statsprocessor
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT
cd src
make -j 4
sudo make install
cd $GITREPOROOT

cd /opt/ITSEC/4.Password/2.Local/HASHCAT/hashcat/hashcat/princeprocessor
sudo make uninstall
make clean
GITRESET
GITSBMDLINIT
cd src
make -j 4
sudo make install
cd $GITREPOROOT

make -j 4
sudo make install
sudo rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi



