#!/bin/bash


# Veil Evasion is no longer supported, use Veil 3.0! https://github.com/Veil-Framework/Veil
# INSTALL LOG https://hastebin.com/royaxaxoha.sql

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Veil-Framework/Veil
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/Veil/Veil-Framework/Veil
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/Veil/Veil-Framework
EXECUTEABLE1=Veil.py
EXECUTEABLE2=Veil
BINDIR=/usr/local/bin
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
__     _______ ___ _     
\ \   / / ____|_ _| |    
 \ \ / /|  _|  | || |    
  \ V / | |___ | || |___ 
   \_/  |_____|___|_____|
                         
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT

sed -i 's/wine-stable/wine/' /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/Veil/Veil-Framework/Veil/setup/setup.sh
./setup/setup.sh -c
chmod +x $EXECUTEABLE1

sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2