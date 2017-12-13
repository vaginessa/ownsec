#!/bin/sh

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/iphelix/pack.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/pack/iphelix/pack
GITCONFDIR=/opt/ITSEC/4.Password/2.Local/pack/iphelix/pack/.git
GITCLONEDIR=/opt/ITSEC/4.Password/2.Local/pack/iphelix

EXECUTEABLE1=maskgen.py
EXECUTEABLE2=pack_maskgen
EXECUTEABLE3=policygen.py
EXECUTEABLE4=pack_poplicygen
EXECUTEABLE5=rulegen.py
EXECUTEABLE6=pack_rulegen
EXECUTEABLE7=statsgen.py
EXECUTEABLE8=pack_statsgen
BINDIR=/usr/local/bin

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/2.Local/pack
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/pack
DSKTPFL1=pack_maskgen.desktop
DSKTPFL2=pack_policygen.desktop
DSKTPFL3=pack_rulegen.desktop
DSKTPFL4=pack_statsgen.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____   _    ____ _  __
|  _ \ / \  / ___| |/ /
| |_) / _ \| |   | ' / 
|  __/ ___ \ |___| . \ 
|_| /_/   \_\____|_|\_\
                 
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

sudo rm -f $BINDIR/$EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE4
sudo rm -f $BINDIR/$EXECUTEABLE6
sudo rm -f $BINDIR/$EXECUTEABLE8
sudo rm -f $BINDIR/maskgen
sudo rm -f $BINDIR/poplicygen
sudo rm -f $BINDIR/rulegen
sudo rm -f $BINDIR/statsgen

cd $GITREPOROOT
GITSBMDLINIT

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE5
sudo ln -s $GITREPOROOT/$EXECUTEABLE5 $BINDIR/$EXECUTEABLE6
chmod +x $GITREPOROOT/$EXECUTEABLE7
sudo ln -s $GITREPOROOT/$EXECUTEABLE7 $BINDIR/$EXECUTEABLE8

rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
rm -f $DSKTPFLSDEST/$DSKTPFL3
rm -f $DSKTPFLSDEST/$DSKTPFL4

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
