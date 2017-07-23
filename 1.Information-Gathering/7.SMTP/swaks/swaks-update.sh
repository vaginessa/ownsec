#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ______        ___    _  ______  
/ ___\ \      / / \  | |/ / ___| 
\___ \\ \ /\ / / _ \ | ' /\___ \ 
 ___) |\ V  V / ___ \| . \ ___) |
|____/  \_/\_/_/   \_\_|\_\____/ 
            
${normal}"


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko/swaks/
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=swaks
EXECUTEABLE2=swaks
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/7.SMTP
DSKTPFL=swaks.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko
cd /opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko
git clone https://github.com/roman-rybalko/swaks.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi