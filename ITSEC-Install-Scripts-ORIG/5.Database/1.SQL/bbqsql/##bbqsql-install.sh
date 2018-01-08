#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Neohapsis/bbqsql.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis/bbqsql
GITCLONEDIR=/opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database/1.SQL/bbqsql
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL/bbqsql
DSKTPFL=bbqsql.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database/1.SQL/bbqsql
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____   ___  ____   ___  _     
| __ )| __ ) / _ \/ ___| / _ \| |    
|  _ \|  _ \| | | \___ \| | | | |    
| |_) | |_) | |_| |___) | |_| | |___ 
|____/|____/ \__\_\____/ \__\_\_____|
          
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

sudo rm -f /usr/local/bin/bbqsql

sudo -H python setup.py install

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL