#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/orgcandman/simple-fuzzer.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman/simple-fuzzer
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman/simple-fuzzer/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/simple-fuzzer/orgcandman
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/simple-fuzzer
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/15.Fuzzer/simple-fuzzer
DSKTPFL=simple-fuzzer.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/15.Fuzzer/simplefuzzer/simple-fuzzer

#hd6cv

echo "${bold}
 ____ ___ __  __ ____  _     _____ _____ _   _ _______________ ____  
/ ___|_ _|  \/  |  _ \| |   | ____|  ___| | | |__  /__  / ____|  _ \ 
\___ \| || |\/| | |_) | |   |  _| | |_  | | | | / /  / /|  _| | |_) |
 ___) | || |  | |  __/| |___| |___|  _| | |_| |/ /_ / /_| |___|  _ < 
|____/___|_|  |_|_|   |_____|_____|_|    \___//____/____|_____|_| \_\
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

sudo make uninstall
make clean
GITRESET
GITSBMDLINIT
./configure
make -j 4
sudo make install
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi
