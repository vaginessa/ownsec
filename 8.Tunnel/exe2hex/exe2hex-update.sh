#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _______  _______ ____  _   _ _______  __
| ____\ \/ / ____|___ \| | | | ____\ \/ /
|  _|  \  /|  _|   __) | |_| |  _|  \  / 
| |___ /  \| |___ / __/|  _  | |___ /  \ 
|_____/_/\_\_____|_____|_| |_|_____/_/\_\
            
${normal}"

GITREPOROOT=/opt/ITSEC/8.Tunnel/exe2hex/g0tmi1k/exe2hex
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=exe2hex.py
EXECUTEABLE2=exe2hex
EXECUTEABLE3=exe2hex.sh

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/8.Tunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel
DSKTPFL=exe2hex.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/8.Tunnel/exe2hex/g0tmi1k
cd /opt/ITSEC/8.Tunnel/exe2hex/g0tmi1k
git clone https://github.com/g0tmi1k/exe2hex.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

sudo rm -f /usr/local/bin/$EXECUTEABLE2

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive


echo '#!/bin/bash

cd /opt/ITSEC/8.Tunnel/exe2hex/g0tmi1k/exe2hex

python3 exe2hex.py "$@"' > exe2hex.sh
chmod +x exe2hex.sh
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE2
rm -f  $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi


