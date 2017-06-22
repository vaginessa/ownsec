#!/bin/bash

. ~/.bashrc
eval "$(rbenv init -)"
rbenv install 2.4.1
rbenv shell 2.4.1
sudo updatedb
sudo ldconfig

mkdir -p /opt/ITSEC/7.Mitm/bettercap/evilsocket
cd /opt/ITSEC/7.Mitm/bettercap/evilsocket
git clone https://github.com/evilsocket/bettercap.git


gem update
sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/7.Mitm/bettercap/evilsocket/bettercap
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=bettercap.desktop


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _____ _____ _____ _____ ____   ____    _    ____  
| __ )| ____|_   _|_   _| ____|  _ \ / ___|  / \  |  _ \ 
|  _ \|  _|   | |   | | |  _| | |_) | |     / _ \ | |_) |
| |_) | |___  | |   | | | |___|  _ <| |___ / ___ \|  __/ 
|____/|_____| |_|   |_| |_____|_| \_\\____/_/   \_\_|    
               
${normal}"

cd $GITREPOROOT

git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
gem install bundler
bundle update
bundle install
gem build bettercap.gemspec
sudo gem install bettercap*.gem
#rbenv sudo bettercap

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
