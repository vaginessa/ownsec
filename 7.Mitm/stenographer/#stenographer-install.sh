#!bin/bash
bold=$(tput bold)
normal=$(tput sgr0)

GITREPOROOT=/opt/ITSEC/7.Mitm/7.Mitm/stenographer/google/stenographer
BRANCH=master


echo "${bold}
 ____ _____ _____ _   _  ___   ____ ____      _    ____  _   _ _____ ____  
/ ___|_   _| ____| \ | |/ _ \ / ___|  _ \    / \  |  _ \| | | | ____|  _ \ 
\___ \ | | |  _| |  \| | | | | |  _| |_) |  / _ \ | |_) | |_| |  _| | |_) |
 ___) || | | |___| |\  | |_| | |_| |  _ <  / ___ \|  __/|  _  | |___|  _ < 
|____/ |_| |_____|_| \_|\___/ \____|_| \_\/_/   \_\_|   |_| |_|_____|_| \_\
             
INSTALL
${normal}"

cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

sudo rm /usr/local/bin/$EXECUTEABLE2
make clean
sudo updatedb
sudo ldconfig
git clean -f 
git fetch origin
git reset --hard origin/$BRANCH
git pull
git submodule init && git submodule update --recursive
sudo ./install.sh