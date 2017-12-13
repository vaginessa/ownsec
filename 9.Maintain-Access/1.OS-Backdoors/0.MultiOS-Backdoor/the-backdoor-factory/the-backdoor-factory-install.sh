#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/secretsquirrel/the-backdoor-factory
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory/secretsquirrel/the-backdoor-factory
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory/secretsquirrel
EXECUTEABLE1=backdoor.py
EXECUTEABLE2=backdoor-factory
BINDIR=/usr/local/bin
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor
DSKTPFL=backdoorfactory.desktop
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 ____  ____  _____ 
| __ )|  _ \|  ___|
|  _ \| | | | |_   
| |_) | |_| |  _|  
|____/|____/|_|    
           
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

cd $GITREPOROOT

### DEPS:
## Installed w apt lists - see /opt/ITSEC-Install-Scripts/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-backdoorfactory.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT

 cd osslsigncode
    ./autogen.sh
    ./configure
	make
	make install
    cd ..	

	uname -a | grep -i "armv" &> /dev/null
        if [ $? -ne 0 ]; then
                echo "[*] installing appack for onionduke"
		echo "[*] installing dependences"
		sudo apt-get install libc6-dev-i386
                cd ./aPLib/example/
                gcc -c -I../lib/elf -m32 -Wall -O2 -s -o appack.o appack.c -v 
                gcc -m32 -Wall -O2 -s -o appack appack.o ../lib/elf/aplib.a -v 
                sudo cp ./appack /usr/bin/appack        
        else
                echo "[!!!!] Arm not supported for aPLib"
	fi

chmod +x $GITREPOROOT/$EXECUTEABLE1
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2

mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
