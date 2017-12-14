#!/bin/bash

# some wired 0 appended to path during setup, see log line 1550+ https://hastebin.com/izozecogun.tex
# the setup script located under veil repo dir setup/setup.sh is very brainfk to debug, could find the reason on a first try.


bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/Veil-Framework/Veil-Evasion
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/veil-evasion/Veil-Framework/Veil-Evasion
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/veil-evasion/Veil-Framework
EXECUTEABLE1=Veil-Evasion.py
EXECUTEABLE2=veil-evasion
BINDIR=/usr/local/bin
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
__     _______ ___ _          _______     ___    ____ ___ ___  _   _ 
\ \   / / ____|_ _| |        | ____\ \   / / \  / ___|_ _/ _ \| \ | |
 \ \ / /|  _|  | || |   _____|  _|  \ \ / / _ \ \___ \| | | | |  \| |
  \ V / | |___ | || |__|_____| |___  \ V / ___ \ ___) | | |_| | |\  |
   \_/  |_____|___|_____|    |_____|  \_/_/   \_\____/___\___/|_| \_|
            
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

sed -i 's/wine-stable/wine/' /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/veil-evasion/Veil-Framework/Veil-Evasion/setup/setup.sh
cd setup
./setup.sh -s

chmod +x $EXECUTEABLE1

sudo rm -f $BINDIR/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 $BINDIR/$EXECUTEABLE2