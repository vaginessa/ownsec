#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 __  __    _    _     _     ___  ______   __
|  \/  |  / \  | |   | |   / _ \|  _ \ \ / /
| |\/| | / _ \ | |   | |  | | | | |_) \ V / 
| |  | |/ ___ \| |___| |__| |_| |  _ < | |  
|_|  |_/_/   \_\_____|_____\___/|_| \_\|_|  
          
${normal}"


GITREPOROOT=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory
GITREPOGITFILE=$GITREPOROOT/.git

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/8.Tunnel/mallory/justmao945
cd /opt/ITSEC/8.Tunnel/mallory/justmao945
git clone https://github.com/justmao945/mallory.git

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
#nothing todo here

fi

