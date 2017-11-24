#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/fwaeytens/dnsenum.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens
EXECUTEABLE1=dnsenum.sh 
EXECUTEABLE2=dnsenum
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=dnsenum.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  _   _ ____  _____ _   _ _   _ __  __ 
|  _ \| \ | / ___|| ____| \ | | | | |  \/  |
| | | |  \| \___ \|  _| |  \| | | | | |\/| |
| |_| | |\  |___) | |___| |\  | |_| | |  | |
|____/|_| \_|____/|_____|_| \_|\___/|_|  |_|
           
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

echo "#!/bin/bash 
cd /opt/ITSEC/1.Information-Gathering/5.DNS/dnsenum/fwaeytens/dnsenum
perl dnsenum.pl" > $EXECUTEABLE1
chmod +x $EXECUTEABLE1

sudo rm -f $BINDIR/dnsenum

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
