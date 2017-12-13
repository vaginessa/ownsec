#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/OpenSecurityResearch/hostapd-wpe.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch/hostapd-wpe
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch
EXECUTEABLE1=hostapd-wpe.sh
EXECUTEABLE2=hostapd-wpe
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi/4.Evil-Twin
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/4.Evil-Twin
DSKTPFL=hostapd-wpe.desktop
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
 _   _  ___  ____ _____  _    ____  ____     __        ______  _____ 
| | | |/ _ \/ ___|_   _|/ \  |  _ \|  _ \    \ \      / /  _ \| ____|
| |_| | | | \___ \ | | / _ \ | |_) | | | |____\ \ /\ / /| |_) |  _|  
|  _  | |_| |___) || |/ ___ \|  __/| |_| |_____\ V  V / |  __/| |___ 
|_| |_|\___/|____/ |_/_/   \_\_|   |____/       \_/\_/  |_|   |_____|
        
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

rm -rf hostapd-2.6
wget http://hostap.epitest.fi/releases/hostapd-2.6.tar.gz
tar -zxf hostapd-2.6.tar.gz
cd hostapd-2.6
patch -p1 < ../hostapd-wpe.patch 
cd hostapd
make -j 4
sudo make install
cd ../../certs/
./bootstrap

cd ../hostapd-2.6/hostapd
echo "#!/bin/bash
cd /opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch/hostapd-wpe/hostapd-2.6/hostapd

sudo ./hostapd-wpe hostapd-wpe.conf" > $EXECUTEABLE1
#cd /opt/ITSEC/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe/OpenSecurityResearch/hostapd-wpe
chmod +x $EXECUTEABLE1

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


