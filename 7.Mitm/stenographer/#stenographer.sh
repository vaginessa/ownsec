#!bin/bash
#stenographer.go:31:2: cannot find package "github.com/google/stenographer/env" in any of:
#	/usr/lib/go-1.6/src/github.com/google/stenographer/env (from $GOROOT)
#	($GOPATH not set)

GITREPOROOT=/opt/ITSEC/7.Mitm/7.Mitm/stenographer/google/stenographer
GITREPOGITFILE=$GITREPOROOT/.git
bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ _____ _____ _   _  ___   ____ ____      _    ____  _   _ _____ ____  
/ ___|_   _| ____| \ | |/ _ \ / ___|  _ \    / \  |  _ \| | | | ____|  _ \ 
\___ \ | | |  _| |  \| | | | | |  _| |_) |  / _ \ | |_) | |_| |  _| | |_) |
 ___) || | | |___| |\  | |_| | |_| |  _ <  / ___ \|  __/|  _  | |___|  _ < 
|____/ |_| |_____|_| \_|\___/ \____|_| \_\/_/   \_\_|   |_| |_|_____|_| \_\
             
${normal}"


cd $GITREPOROOT
sudo rm /usr/local/bin/$EXECUTEABLE2
make clean
sudo updatedb
sudo ldconfig
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive
sudo ./install.sh