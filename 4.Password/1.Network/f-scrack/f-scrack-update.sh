#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/zgwdg/F-Scrack.git
#GITREPOROOT=/opt/ITSEC/4.Password/1.Network/f-scrack/ysrc/F-Scrack
#GITREPOROOT=/opt/ITSEC/4.Password/1.Network/f-scrack/y1ng1996/F-Scrack
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/f-scrack/zgwdg/F-Scrack
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/f-scrack/zgwdg
EXECUTEABLE1=F-Scrack.sh
EXECUTEABLE2=fscrack
EXECUTEABLE3=F-Scrack.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=f-scrack.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____    ____   ____ ____      _    ____ _  __
|  ___|  / ___| / ___|  _ \    / \  / ___| |/ /
| |_ ____\___ \| |   | |_) |  / _ \| |   | ' / 
|  _|_____|__) | |___|  _ <  / ___ \ |___| . \ 
|_|      |____/ \____|_| \_\/_/   \_\____|_|\_\
            
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

#cd /opt/ITSEC/4.Password/1.Network/f-scrack/ysrc/F-Scrack
cd /opt/ITSEC/4.Password/1.Network/f-scrack/zgwdg/F-Scrack

python F-Scrack.py "$@"' > $EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
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

