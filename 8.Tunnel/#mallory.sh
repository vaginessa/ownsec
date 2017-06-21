#!/bin/bash

mkdir -p /opt/ITSEC/8.Tunnel/mallory/justmao945
cd /opt/ITSEC/8.Tunnel/mallory/justmao945
git clone https://github.com/justmao945/mallory.git

sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory
#
cd $GITREPOROOT
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init
 git submodule update --recursive
#
#nothing todo here