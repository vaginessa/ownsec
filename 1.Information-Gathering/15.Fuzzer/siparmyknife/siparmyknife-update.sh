#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/foreni-packages/siparmyknife.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages/siparmyknife
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages/siparmyknife/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages
BINDIR=/usr/local/bin
EXECUTEABLE1=siparmyknife.pl
EXECUTEABLE2=siparmyknife
EXECUTEABLE3=siparmyknife.sh
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
 ____ ___ ____   _    ____  __  ____   ______  _  ___   _ ___ _____ _____ 
/ ___|_ _|  _ \ / \  |  _ \|  \/  \ \ / / ___|| |/ / \ | |_ _|  ___| ____|
\___ \| || |_) / _ \ | |_) | |\/| |\ V /\___ \| ' /|  \| || || |_  |  _|  
 ___) | ||  __/ ___ \|  _ <| |  | | | |  ___) | . \| |\  || ||  _| | |___ 
|____/___|_| /_/   \_\_| \_\_|  |_| |_| |____/|_|\_\_| \_|___|_|   |_____|
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

cd $GITREPOROOT

GITRESET

GITSBMDLINIT

echo '#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages/siparmyknife
./siparmyknife.pl "$@"' >> $EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $/$EXECUTEABLE2

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi