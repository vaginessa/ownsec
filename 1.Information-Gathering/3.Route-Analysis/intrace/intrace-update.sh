#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ___ _   _ _____ ____      _    ____ _____ 
|_ _| \ | |_   _|  _ \    / \  / ___| ____|
 | ||  \| | | | | |_) |  / _ \| |   |  _|  
 | || |\  | | | |  _ <  / ___ \ |___| |___ 
|___|_| \_| |_| |_| \_\/_/   \_\____|_____|
                                               
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki/intrace
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFL=intrace.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki
cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki
git clone https://github.com/robertswiecki/intrace.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

sudo rm -f /usr/local/bin/intrace

cd $GITREPOROOT

make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init   
git submodule update --recursive
sudo ldconfig 
sudo updatedb
make -j 4
sudo ln -s /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki/intrace/intrace /usr/local/bin/intrace
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi
