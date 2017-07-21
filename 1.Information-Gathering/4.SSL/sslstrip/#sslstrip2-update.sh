#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ____  _     ____ _____ ____  ___ ____  
/ ___/ ___|| |   / ___|_   _|  _ \|_ _|  _ \ 
\___ \___ \| |   \___ \ | | | |_) || || |_) |
 ___) |__) | |___ ___) || | |  _ < | ||  __/ 
|____/____/|_____|____/ |_| |_| \_\___|_|    
     
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r/sslstrip2
GITREPOGITFILE=$GITREPOROOT/.git

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r
cd /opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r
git clone https://github.com/byt3bl33d3r/sslstrip2.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT

git clean -f 
git pull
git submodule init
git submodule update --recursive
sudo python setup.py install

fi