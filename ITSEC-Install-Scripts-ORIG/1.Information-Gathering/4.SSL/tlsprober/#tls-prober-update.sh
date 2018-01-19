#unfinished
#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/WestpointLtd/tls_prober.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd/tls_prober
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/tls_prober/WestpointLtd
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 _____ _     ____  ____  ____   ___  ____  _____ ____  
|_   _| |   / ___||  _ \|  _ \ / _ \| __ )| ____|  _ \ 
  | | | |   \___ \| |_) | |_) | | | |  _ \|  _| | |_) |
  | | | |___ ___) |  __/|  _ <| |_| | |_) | |___|  _ < 
  |_| |_____|____/|_|   |_| \_\\___/|____/|_____|_| \_\
             
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITSBMDLINIT

fi
