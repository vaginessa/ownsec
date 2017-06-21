#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki
cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki
git clone https://github.com/robertswiecki/intrace.git

sudo updatedb
sudo ldconfig

sudo rm -f /usr/local/bin/intrace
cd /opt/ITSEC/1.Information-Gathering/3.Route-Analysis/intrace/robertswiecki/intrace

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/3.Route-Analysis
DSKTPFL=intrace.desktop


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
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
