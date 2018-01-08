#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/digininja/RSMangler
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja/RSMangler
GITCONFDIR=/opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja/RSMangler/.git
GITCLONEDIR=/opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja
EXECUTEABLE1=rsmangler.sh
EXECUTEABLE2=rsmangler
EXECUTEABLE3=rsmangler.rb
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/4.Password/3.Wordlist
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist
DSKTPFL=rsmangler.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____  __  __    _    _   _  ____ _     _____ ____  
|  _ \/ ___||  \/  |  / \  | \ | |/ ___| |   | ____|  _ \ 
| |_) \___ \| |\/| | / _ \ |  \| | |  _| |   |  _| | |_) |
|  _ < ___) | |  | |/ ___ \| |\  | |_| | |___| |___|  _ < 
|_| \_\____/|_|  |_/_/   \_\_| \_|\____|_____|_____|_| \_\
         
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
cd $GITREPOROOT
GITRESET
GITSBMDLINIT

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja/RSMangler
ruby rsmangler.rb "$@"' > /$EXECUTEABLE1

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