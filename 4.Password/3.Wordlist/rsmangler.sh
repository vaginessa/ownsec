#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____  __  __    _    _   _  ____ _     _____ ____  
|  _ \/ ___||  \/  |  / \  | \ | |/ ___| |   | ____|  _ \ 
| |_) \___ \| |\/| | / _ \ |  \| | |  _| |   |  _| | |_) |
|  _ < ___) | |  | |/ ___ \| |\  | |_| | |___| |___|  _ < 
|_| \_\____/|_|  |_/_/   \_\_| \_|\____|_____|_____|_| \_\
         
${normal}"


mkdir -p /opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja
cd /opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja
git clone https://github.com/digininja/RSMangler
#

GITREPOROOT=/opt/ITSEC/4.Password/3.Wordlist/rsmangler/digininja/RSMangler
EXECUTEABLE1=rsmangler.rb
EXECUTEABLE2=rsmangler
#
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/3.Wordlist
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist
DSKTPFL=rsmangler.desktop


cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
#
chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
mkdir -p $DSKTPFLSDEST 
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL