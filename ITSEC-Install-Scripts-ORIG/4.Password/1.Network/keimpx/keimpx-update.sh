#!/bin/bash
#NOT WORKING
#
bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/inquisb/keimpx.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/1.Network/keimpx/inquisb/keimpx
GITCLONEDIR=/opt/ITSEC/4.Password/1.Network/keimpx/inquisb
GITCONFDIR=/opt/ITSEC/4.Password/1.Network/keimpx/inquisb/keimpx/.git
EXECUTEABLE1=keimpx.sh
EXECUTEABLE2=keimpx
EXECUTEABLE3=keimpx.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/keimpx
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network/keimpx
DSKTPFL=keimpx.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/1.Network/keimpx
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}


echo "${bold}
 _  _______ ___ __  __ ______  __
| |/ / ____|_ _|  \/  |  _ \ \/ /
| ' /|  _|  | || |\/| | |_) \  / 
| . \| |___ | || |  | |  __//  \ 
|_|\_\_____|___|_|  |_|_|  /_/\_\
              
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

sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig
#sudo python3 setup.py install

echo '#!/bin/bash
cd /opt/ITSEC/4.Password/1.Network/keimpx/inquisb/keimpx
 
python keimpx.py "$@"' > $EXECUTEABLE1

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
