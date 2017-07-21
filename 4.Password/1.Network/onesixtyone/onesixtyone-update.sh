#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
  ___  _   _ _____ ____ _____  _________   _____  _   _ _____ 
 / _ \| \ | | ____/ ___|_ _\ \/ /_   _\ \ / / _ \| \ | | ____|
| | | |  \| |  _| \___ \| | \  /  | |  \ V / | | |  \| |  _|  
| |_| | |\  | |___ ___) | | /  \  | |   | || |_| | |\  | |___ 
 \___/|_| \_|_____|____/___/_/\_\ |_|   |_| \___/|_| \_|_____|
               
${normal}"

GITREPOROOT=/opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/1.Network
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/1.Network
DSKTPFL=onesixtyone.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits
cd /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits
git clone https://github.com/trailofbits/onesixtyone.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

make -j 4

echo '#!/bin/bash

cd /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone

./onesixtyone "$@"' > onesixtyone.sh
chmod +x onesixtyone.sh
sudo rm -f /usr/local/bin/onesixtyone
sudo ln -s /opt/ITSEC/4.Password/1.Network/onesixtyone/trailofbits/onesixtyone/onesixtyone.sh /usr/local/bin/onesixtyone
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi
