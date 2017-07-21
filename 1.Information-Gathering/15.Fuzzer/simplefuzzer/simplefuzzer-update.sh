#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ___ __  __ ____  _     _____ _____ _   _ _______________ ____  
/ ___|_ _|  \/  |  _ \| |   | ____|  ___| | | |__  /__  / ____|  _ \ 
\___ \| || |\/| | |_) | |   |  _| | |_  | | | | / /  / /|  _| | |_) |
 ___) | || |  | |  __/| |___| |___|  _| | |_| |/ /_ / /_| |___|  _ < 
|____/___|_|  |_|_|   |_____|_____|_|    \___//____/____|_____|_| \_\
             
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman/simple-fuzzer
GITREPOGITFILE=$GITREPOROOT/.git


if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman
git clone https://github.com/orgcandman/simple-fuzzer.git


else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f 
git pull
git submodule init
git submodule update --recursive

./configure
make -j 4
sudo make install


fi
