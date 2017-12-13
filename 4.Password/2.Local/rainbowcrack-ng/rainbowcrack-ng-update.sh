#!/bin/bash
#DEPENDS HASHCAT

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/kholia/rainbowcrack-ng.git
BRANCH=ng
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/rainbowcrack/kholia/rainbowcrack-ng
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/rainbowcrack/kholia
GITREPOBINDIR=/opt/ITSEC/4.Password/2.Local/rainbowcrack/kholia/rainbowcrack-ng/src
EXECUTEABLE1=rcrack
EXECUTEABLE2=rcrack
EXECUTEABLE3=rtdump
EXECUTEABLE4=rtdump
EXECUTEABLE5=rtgen
EXECUTEABLE6=rtgen
EXECUTEABLE7=rtsort
EXECUTEABLE8=rtsort
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local
DSKTPFL1=rainbowcrack-ng_rcrack.desktop
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
 ____      _    ___ _   _ ____   _____        ______ ____      _    ____ _  __
|  _ \    / \  |_ _| \ | | __ ) / _ \ \      / / ___|  _ \    / \  / ___| |/ /
| |_) |  / _ \  | ||  \| |  _ \| | | \ \ /\ / / |   | |_) |  / _ \| |   | ' / 
|  _ <  / ___ \ | || |\  | |_) | |_| |\ V  V /| |___|  _ <  / ___ \ |___| . \ 
|_| \_\/_/   \_\___|_| \_|____/ \___/  \_/\_/  \____|_| \_\/_/   \_\____|_|\_\
           
INSTALL
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

cd $GITREPOBINDIR
make uninstall
make clean

cd $GITREPOROOT
GITRESET
GITSBMDLINIT
cd $GITREPOBINDIR

make -j 4 
#sudo make install

sudo rm -f $BINDIR/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE4
sudo rm -f $BINDIR/$EXECUTEABLE6
sudo rm -f $BINDIR/$EXECUTEABLE8

chmod +x $GITREPOBINDIR/$EXECUTEABLE1
sudo ln -s $GITREPOBINDIR/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOBINDIR/$EXECUTEABLE3
sudo ln -s $GITREPOBINDIR/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
chmod +x $GITREPOBINDIR/$EXECUTEABLE5
sudo ln -s $GITREPOBINDIR/$EXECUTEABLE5 $BINDIR/$EXECUTEABLE6
chmod +x $GITREPOBINDIR/$EXECUTEABLE7
sudo ln -s $GITREPOBINDIR/$EXECUTEABLE7 $BINDIR/$EXECUTEABLE8

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL4 $DSKTPFLSDEST/$DSKTPFL4

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

