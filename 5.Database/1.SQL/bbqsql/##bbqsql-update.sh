#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____   ___  ____   ___  _     
| __ )| __ ) / _ \/ ___| / _ \| |    
|  _ \|  _ \| | | \___ \| | | | |    
| |_) | |_) | |_| |___) | |_| | |___ 
|____/|____/ \__\_\____/ \__\_\_____|
          
${normal}"

GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis/bbqsql
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/5.Database/1.SQL
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL
DSKTPFL=bbqsql.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis
cd /opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis
git clone https://github.com/Neohapsis/bbqsql.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

sudo rm -f /usr/local/bin/bbqsql
#

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

sudo -H python setup.py install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi

