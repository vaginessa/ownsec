#!/bin/bash

#works - rbenv ruby preinstalled with metasploit

mkdir -p /opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie
cd /opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie
git clone git://git.kali.org/packages/wol-e.git

sudo ldconfig
sudo updatedb
#
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie/wol-e
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host
DSKTPFL=wol-e.desktop

EXECUTEABLE1=wol-e.py
EXECUTEABLE2=wol-e

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive

sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
#rbenv shell 2.4.1
#bundle install
#gem install foreman
#bundle exec rake db:migrate

#foreman s