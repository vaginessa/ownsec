#!/bin/bash

mkdir -p /opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis/
cd /opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis/
git clone https://github.com/Neohapsis/bbqsql.git

sudo ldconfig
sudo updatedb
#
sudo rm /usr/local/bin/sqlmapapi
sudo rm /usr/local/bin/sqlmap
#
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/sqlmap/sqlmapproject/sqlmap
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/5.Database/1.SQL
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL
DSKTPFL=bbqsql.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
#

sudo -H python setup.py install

mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL