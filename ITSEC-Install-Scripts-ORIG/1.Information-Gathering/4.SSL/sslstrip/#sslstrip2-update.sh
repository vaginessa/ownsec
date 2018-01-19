#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/byt3bl33d3r/sslstrip2.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r/sslstrip2
GITCONFDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r/sslstrip2/.git
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/4.SSL/sslstrip2/byt3bl33d3r
gg6g6
	git clean -f
	git fetch origin
	git reset --hard origin/master
	git pull
}
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt
#ph1a

echo "${bold}
 ____ ____  _     ____ _____ ____  ___ ____ ____  
/ ___/ ___|| |   / ___|_   _|  _ \|_ _|  _ \___ \ 
\___ \___ \| |   \___ \ | | | |_) || || |_) |__) |
 ___) |__) | |___ ___) || | |  _ < | ||  __// __/ 
|____/____/|_____|____/ |_| |_| \_\___|_|  |_____|
                                                  
UPDATE
${normal}"

ggdgdssddw

then

GITCLONEFUNC
GITCLONEFUNC
git clone $GITREPO

else

ggdgdssdw

fi

GITCLONEFUNC

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT
sudo python setup.py install

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi