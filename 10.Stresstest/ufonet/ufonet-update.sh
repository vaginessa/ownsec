#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/epsylon/ufonet
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
GITCONFDIR=/opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet/.git
GITCLONEDIR=/opt/ITSEC/10.Stresstest/ufonet/epsylon
EXECUTEABLE1=ufonet.sh
EXECUTEABLE2=ufonet
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/10.Stresstest
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest
DSKTPFL=ufonet.desktop
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
 _   _ _____ ___  _   _ _____ _____ 
| | | |  ___/ _ \| \ | | ____|_   _|
| | | | |_ | | | |  \| |  _|   | |  
| |_| |  _|| |_| | |\  | |___  | |  
 \___/|_|   \___/|_| \_|_____| |_|  
           
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
GITSBMDLINIT

#sudo python setup.py install

echo '#!/bin/bash
cd /opt/ITSEC/10.Stresstest/ufonet/epsylon/ufonet
./ufonet "$@"' > $EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE2
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

