#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Ethical-H4CK3R/Aircrack
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R
EXECUTEABLE1=aircrack.sh
EXECUTEABLE2=aircrack
EXECUTEABLE3=aircrack.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/aircrack
DSKTPFL=aircrack.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/aircrack
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
    _    _                         _    
   / \  (_)_ __ ___ _ __ __ _  ___| | __
  / _ \ | | '__/ __| '__/ _  |/ __| |/ /
 / ___ \| | | | (__| | | (_| | (__|   < 
/_/   \_\_|_|  \___|_|  \__ _|\___|_|\_\
       
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
#sudo -H pip2 install -r requirements.txt
sudo updatedb
sudo ldconfig

rm -f $EXECUTEABLE3
echo '#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/aircrack/Ethical-H4CK3R/Aircrack

sudo python aircrack.py "$@"' > $EXECUTEABLE3

#sed -i 's#=(#=$(#g' $EXECUTEABLE3
#sed -i 's#--iface #--iface $wifiadapter#g' $EXECUTEABLE3

chmod +x $GITREPOROOT/$EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 $BINDIR/$EXECUTEABLE2
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
