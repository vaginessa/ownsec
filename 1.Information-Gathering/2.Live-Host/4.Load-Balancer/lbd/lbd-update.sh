#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _     ____  ____  
| |   | __ )|  _ \ 
| |   |  _ \| | | |
| |___| |_) | |_| |
|_____|____/|____/ 
                     
${normal}"


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI/lbd
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host/4.Load-Balancer
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/4.Load-Balancer
DSKTPFL=lbd.desktop

EXECUTEABLE1=lbd
EXECUTEABLE2=lbd

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/4.Load-Balancer/lbd/KALI
git clone git://git.kali.org/packages/lbd.git

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

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi