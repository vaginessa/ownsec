#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____ ___ ____   _    ____  __  ____   ______  _  ___   _ ___ _____ _____ 
/ ___|_ _|  _ \ / \  |  _ \|  \/  \ \ / / ___|| |/ / \ | |_ _|  ___| ____|
\___ \| || |_) / _ \ | |_) | |\/| |\ V /\___ \| ' /|  \| || || |_  |  _|  
 ___) | ||  __/ ___ \|  _ <| |  | | | |  ___) | . \| |\  || ||  _| | |___ 
|____/___|_| /_/   \_\_| \_\_|  |_| |_| |____/|_|\_\_| \_|___|_|   |_____|
                
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages/siparmyknife
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=siparmyknife.pl
EXECUTEABLE2=siparmyknife
EXECUTEABLE3=siparmyknife.sh

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages
git clone https://github.com/foreni-packages/siparmyknife.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else


cd $GITREPOROOT
sudo rm /usr/local/bin/$EXECUTEABLE2

git clean -f 
git pull
git submodule init
git submodule update --recursive

echo '#!/bin/bash
cd /opt/ITSEC/1.Information-Gathering/15.Fuzzer/siparmyknife/foreni-packages/siparmyknife
./siparmyknife.pl "$@"' >> $EXECUTEABLE3
chmod +x $GITREPOROOT/$EXECUTEABLE1
chmod +x $GITREPOROOT/$EXECUTEABLE3
sudo ln -s $GITREPOROOT/$EXECUTEABLE3 /usr/local/bin/$EXECUTEABLE2

fi