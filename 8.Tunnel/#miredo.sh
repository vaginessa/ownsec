#bug https://unix.stackexchange.com/questions/219152/pkglibexecdir-is-not-a-legitimate-directory


#!/bin/bash
#
#
mkdir -p /opt/ITSEC/8.Tunnel/miredo/darconeous
cd /opt/ITSEC/8.Tunnel/miredo/darconeous
git clone https://github.com/darconeous/miredo.git

sudo updatedb
sudo ldconfig
#
GITREPOROOT=/opt/ITSEC/8.Tunnel/miredo/darconeous/miredo
#
cd $GITREPOROOT

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
#
./autogen.sh
