#!/bin/bash
. ~/.bashrc
eval "$(rbenv init -)"
rbenv install 2.4.1
rbenv shell 2.4.1
sudo updatedb
sudo ldconfig

mkdir -p /opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja
cd /opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja
git clone https://github.com/digininja/twofi.git

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/twofi/digininja/twofi
EXECUTEABLE1=twofi.rb
EXECUTEABLE2=twofi

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT
DSKTPFL=twofi.desktop

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _______        _____  _____ ___ 
|_   _\ \      / / _ \|  ___|_ _|
  | |  \ \ /\ / / | | | |_   | | 
  | |   \ V  V /| |_| |  _|  | | 
  |_|    \_/\_/  \___/|_|   |___|
    
${normal}"


cd $GITREPOROOT
sudo rm /usr/local/bin/$EXECUTEABLE2
sudo updatedb
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
bundle install
chmod a+x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL