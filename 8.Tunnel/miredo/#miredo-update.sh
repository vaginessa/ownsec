#bug https://unix.stackexchange.com/questions/219152/pkglibexecdir-is-not-a-legitimate-directory


#!/bin/bash
#
bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 __  __ ___ ____  _____ ____   ___  
|  \/  |_ _|  _ \| ____|  _ \ / _ \ 
| |\/| || || |_) |  _| | | | | | | |
| |  | || ||  _ <| |___| |_| | |_| |
|_|  |_|___|_| \_\_____|____/ \___/ 
          
${normal}"

GITREPOROOT=/opt/ITSEC/8.Tunnel/miredo/darconeous/miredo
GITREPOGITFILE=$GITREPOROOT/.git

if [ ! -d $GITREPOGITFILE ]

then


mkdir -p /opt/ITSEC/8.Tunnel/miredo/darconeous
cd /opt/ITSEC/8.Tunnel/miredo/darconeous
git clone https://github.com/darconeous/miredo.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


cd $GITREPOROOT

git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
#
./autogen.sh

fi

