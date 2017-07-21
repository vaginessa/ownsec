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

GITREPOGITFILE=$GITREPOROOT/.git

cd /opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r/sslstrip2

git clean -f 
git pull
git submodule init
git submodule update --recursive
sudo python setup.py install