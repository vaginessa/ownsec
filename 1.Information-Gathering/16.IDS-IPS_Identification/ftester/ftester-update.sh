#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _____ _____ ____ _____ _____ ____  
|  ___|_   _| ____/ ___|_   _| ____|  _ \ 
| |_    | | |  _| \___ \ | | |  _| | |_) |
|  _|   | | | |___ ___) || | | |___|  _ < 
|_|     |_| |_____|____/ |_| |_____|_| \_\
              
${normal}"


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath/ftester
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE2=ftest
EXECUTEABLE4=ftestd
EXECUTEABLE6=freport

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/16.IDS-IPS_Identification
DSKTPFL1=ftester.desktop
DSKTPFL2=ftestd.desktop
DSKTPFL3=freport.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath
cd /opt/ITSEC/1.Information-Gathering/16.IDS-IPS_Identification/ftester/inversepath
git clone https://github.com/inversepath/ftester.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

sudo rm /usr/local/bin/$EXECUTEABLE2
sudo rm /usr/local/bin/$EXECUTEABLE4
sudo rm /usr/local/bin/$EXECUTEABLE6

rm -f $EXECUTEABLE1
rm -f $EXECUTEABLE3
rm -f $EXECUTEABLE5

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive

chmod +x $GITREPOROOT/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE2
chmod +x $GITREPOROOT/$EXECUTEABLE4
sudo ln -s $GITREPOROOT/$EXECUTEABLE4 /usr/local/bin/$EXECUTEABLE4
chmod +x $GITREPOROOT/$EXECUTEABLE6
sudo ln -s $GITREPOROOT/$EXECUTEABLE6 /usr/local/bin/$EXECUTEABLE6
rm -f $DSKTPFLSDEST/$DSKTPFL1
rm -f $DSKTPFLSDEST/$DSKTPFL2
rm -f $DSKTPFLSDEST/$DSKTPFL3

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL1 $DSKTPFLSDEST/$DSKTPFL1
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL2 $DSKTPFLSDEST/$DSKTPFL2
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL3 $DSKTPFLSDEST/$DSKTPFL3

fi
