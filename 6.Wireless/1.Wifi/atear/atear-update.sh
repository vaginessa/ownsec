#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/NORMA-Inc/AtEar.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc
EXECUTEABLE1=atear.sh
EXECUTEABLE2=atear
EXECUTEABLE3=run.py
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=atear.desktop
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
    _  _____ _____    _    ____  
   / \|_   _| ____|  / \  |  _ \ 
  / _ \ | | |  _|   / _ \ | |_) |
 / ___ \| | | |___ / ___ \|  _ < 
/_/   \_\_| |_____/_/   \_\_| \_\
           
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
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT
sudo -H pip2 install -r requirements.txt
sudo udpatedb
sudo ldconfig

rm -f $EXECUTEABLE3
echo "#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/atear/NORMA-Inc/AtEar 
firefox 127.0.0.1:8080 </dev/null &>/dev/null &
sudo python run.py --iface wlan0" > $EXECUTEABLE1

#sed -i 's#=(#=$(#g' $EXECUTEABLE3
#sed -i 's#--iface #--iface $wifiadapter#g' $EXECUTEABLE3

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

