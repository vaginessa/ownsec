#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____    ____   ____ ____      _    ____ _  __
|  ___|  / ___| / ___|  _ \    / \  / ___| |/ /
| |_ ____\___ \| |   | |_) |  / _ \| |   | ' / 
|  _|_____|__) | |___|  _ <  / ___ \ |___| . \ 
|_|      |____/ \____|_| \_\/_/   \_\____|_|\_\
             
${normal}"

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/f-scrack/ysrc/F-Scrack
EXECUTEABLE1=F-Scrack.py
EXECUTEABLE2=fscrack
EXECUTEABLE3=fscrack.sh
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=f-scrack.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/4.Password/1.Network/f-scrack/ysrc
cd /opt/ITSEC/4.Password/1.Network/f-scrack/ysrc
git clone https://github.com/ysrc/F-Scrack.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

sudo rm -f /usr/local/bin/$EXECUTEABLE2


cd $GITREPOROOT
sudo updatedb
sudo ldconfig
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/f-scrack/ysrc/F-Scrack
python F-Scrack.py "$@"' > $EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

