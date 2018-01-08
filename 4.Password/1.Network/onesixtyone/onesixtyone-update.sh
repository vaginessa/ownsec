#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/trailofbits/onesixtyone.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone/.git
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits
EXECUTEABLE1=onesixtyone.sh
EXECUTEABLE2=onesixtyone
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=onesixtyone.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
  ___  _   _ _____ ____ _____  _________   _____  _   _ _____ 
 / _ \| \ | | ____/ ___|_ _\ \/ /_   _\ \ / / _ \| \ | | ____|
| | | |  \| |  _| \___ \| | \  /  | |  \ V / | | |  \| |  _|  
| |_| | |\  | |___ ___) | | /  \  | |   | || |_| | |\  | |___ 
 \___/|_| \_|_____|____/___/_/\_\ |_|   |_| \___/|_| \_|_____|
               
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

make clean
GITRESET
GITSBMDLINIT

make -j 4

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone

./onesixtyone "$@"' > $EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2

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

