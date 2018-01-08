#unfinished
#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/WestpointLtd/tls_prober.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd/tls_prober
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
 _____ _     ____  ____  ____   ___  ____  _____ ____  
|_   _| |   / ___||  _ \|  _ \ / _ \| __ )| ____|  _ \ 
  | | | |   \___ \| |_) | |_) | | | |  _ \|  _| | |_) |
  | | | |___ ___) |  __/|  _ <| |_| | |_) | |___|  _ < 
  |_| |_____|____/|_|   |_| \_\\___/|____/|_____|_| \_\
             
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout $BRANCH &&
    git fetch origin $BRANCH &&
    [ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
    git merge origin/$BRANCH
then
    
cd $GITREPOROOT
GITSBMDLINIT

fi
