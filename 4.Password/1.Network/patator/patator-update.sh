#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=ttps://github.com/lanjelot/patator.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/patator/lanjelot/patator
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/patator/lanjelot/patator/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/patator/lanjelot
EXECUTEABLE1=patator.sh
EXECUTEABLE2=patator
EXECUTEABLE3=patator.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=patator.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____   _  _____  _  _____ ___  ____  
|  _ \ / \|_   _|/ \|_   _/ _ \|  _ \ 
| |_) / _ \ | | / _ \ | || | | | |_) |
|  __/ ___ \| |/ ___ \| || |_| |  _ < 
|_| /_/   \_\_/_/   \_\_| \___/|_| \_\
          
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
GITRESET
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT

sudo -H pip2 install pyOpenSSL impacket IPy dnspython
sudo updatedb
sudo ldconfig

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/patator/lanjelot/patator
python patator.py "$@"' > $EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
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


