#!/bin/bash


mkdir -p /opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux
cd /opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux
git clone https://github.com/gamelinux/passivedns.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/5.DNS/passivedns/gamelinux/passivedns

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/5.DNS
DSKTPFL=passivedns.desktop

cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf
./configure
make -j 4
sudo make install
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
