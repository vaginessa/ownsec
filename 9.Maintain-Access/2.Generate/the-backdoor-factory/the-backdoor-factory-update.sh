#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  ____  _____ 
| __ )|  _ \|  ___|
|  _ \| | | | |_   
| |_) | |_| |  _|  
|____/|____/|_|    
           
${normal}"


GITREPOROOT=/opt/ITSEC/9.Maintain-Access/2.Generate/the-backdoor-factory/secretsquirrel/the-backdoor-factory
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=backdoor.py
EXECUTEABLE2=backdoor-factory

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFL=backdoorfactory.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/9.Maintain-Access/2.Generate/the-backdoor-factory/secretsquirrel
cd /opt/ITSEC/9.Maintain-Access/2.Generate/the-backdoor-factory/secretsquirrel
git clone https://github.com/secretsquirrel/the-backdoor-factory

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive
#
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
sudo ln -s $GITREPOROOT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi


