#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/savio-code/fern-wifi-cracker.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code/fern-wifi-cracker/Fern-Wifi-Cracker
GITCONFDIR=/opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code/fern-wifi-cracker/Fern-Wifi-Cracker/.git
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code
EXECUTEABLE1=execute.py
EXECUTEABLE2=fern-wifi-cracker
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=fern-wifi-cracker.desktop
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
 _____ _____ ____  _   _ 
|  ___| ____|  _ \| \ | |
| |_  |  _| | |_) |  \| |
|  _| | |___|  _ <| |\  |
|_|   |_____|_| \_\_| \_|
          
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
sudo rm -f /usr/local/bin/$EXECUTEABLE2
GITRESET
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT
echo "#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code/fern-wifi-cracker/Fern-Wifi-Cracker

sudo python execute.py" > $EXECUTEABLE2
sudo chmod +x $EXECUTEABLE1
sudo chmod +x $EXECUTEABLE2
sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 $BINDIR/$EXECUTEABLE2
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
