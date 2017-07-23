#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _   _ _   _ __  __ _  _   _     ___ _   _ _   ___  __
| ____| \ | | | | |  \/  | || | | |   |_ _| \ | | | | \ \/ /
|  _| |  \| | | | | |\/| | || |_| |    | ||  \| | | | |\  / 
| |___| |\  | |_| | |  | |__   _| |___ | || |\  | |_| |/  \ 
|_____|_| \_|\___/|_|  |_|  |_| |_____|___|_| \_|\___//_/\_\
   
${normal}"


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs/enum4linux
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFL=enum4linux.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs
cd /opt/ITSEC/1.Information-Gathering/6.SMB/enum4linux/portcullislabs
git clone https://github.com/portcullislabs/enum4linux.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


cd $GITREPOROOT
sudo rm -r /usr/local/bin/enum4linux

git clean -f
git fetch origin
git reset --hard origin/master
git pull

chmod +x $GITREPOROOT/enum4linux.pl
sudo ln -s $GITREPOROOT/enum4linux.pl /usr/local/bin/enum4linux

sudo updatedb
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
fi
