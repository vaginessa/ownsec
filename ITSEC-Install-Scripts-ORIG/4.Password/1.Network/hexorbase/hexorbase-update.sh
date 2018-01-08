#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/savio-code/hexorbase.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase/.git
GITREPOBINROOT=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase/HexorBase
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/hexorbase/savio-code
EXECUTEABLE1=hexorbase.sh
EXECUTEABLE2=hexorbase
EXECUTEABLE3=execute.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/hexorbase
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/hexorbase
DSKTPFL=hexorbase.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _   _ _______  _____  ____  ____    _    ____  _____ 
| | | | ____\ \/ / _ \|  _ \| __ )  / \  / ___|| ____|
| |_| |  _|  \  / | | | |_) |  _ \ / _ \ \___ \|  _|  
|  _  | |___ /  \ |_| |  _ <| |_) / ___ \ ___) | |___ 
|_| |_|_____/_/\_\___/|_| \_\____/_/   \_\____/|_____|
           
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
GITSBMDLINIT

cd $GITREPOBINROOT

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/hexorbase/savio-code/hexorbase/HexorBase

python execute.py "$@"' > $GITREPOBINROOT/$EXECUTEABLE1

chmod +x $GITREPOBINROOT/$EXECUTEABLE3

chmod +x $GITREPOBINROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOBINROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST
rm -f $DSKTPFLSDEST/$DSKTPFL
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL



#wget 'http://download.oracle.com/otn/linux/instantclient/122010/instantclient-basic-linux.x64-12.2.0.1.0.zip' 

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi


