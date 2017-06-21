#!/bin/bash

mkdir -p /opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder
cd /opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder
git clone https://github.com/pcoder/DNSTracer.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder/DNSTracer

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=dnstracer.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

sudo rm  /usr/local/bin/dnstracer

chmod +x /opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder/DNSTracer/mypydig.py
sudo ln -s //opt/ITSEC/1.Information-Gathering/5.DNS/dnstracer/pcoder/DNSTracer/mypydig.py /usr/local/bin/dnstracer

sudo updatedb
sudo locate /usr/local/bin | grep dnstracer
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
