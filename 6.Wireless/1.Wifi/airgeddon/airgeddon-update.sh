#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
    _    ___ ____   ____ _____ ____  ____   ___  _   _ 
   / \  |_ _|  _ \ / ___| ____|  _ \|  _ \ / _ \| \ | |
  / _ \  | || |_) | |  _|  _| | | | | | | | | | |  \| |
 / ___ \ | ||  _ <| |_| | |___| |_| | |_| | |_| | |\  |
/_/   \_\___|_| \_\\____|_____|____/|____/ \___/|_| \_|
                
${normal}"


GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3/airgeddon
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=airgeddon.desktop


cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3
cd /opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3
git clone https://github.com/v1s1t0r1sh3r3/airgeddon

sudo rm /usr/local/bin/airgeddon

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

echo '#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/airgeddon/v1s1t0r1sh3r3/airgeddon
sudo ./airgeddon.sh "$@"' > airgeddon_run.sh

chmod +x $GITREPOROOT/airgeddon.sh
chmod +x $GITREPOROOT/airgeddon_run.sh
sudo ln -s $GITREPOROOT/airgeddon_run.sh /usr/local/bin/airgeddon
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi
