#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Neohapsis/bbqsql.git
BRANCH=master
GITCONFDIR=/opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis/bbqsql/.git
GITREPOROOT=/opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis/bbqsql
GITCLONEDIR=/opt/ITSEC/5.Database/1.SQL/bbqsql/Neohapsis
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database/1.SQL/bbqsql
DSKTPFLSDEST=/home/$USER/.local/share/applications/5.Database/1.SQL/bbqsql
DSKTPFL=bbqsql.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database/1.SQL/bbqsql
#ph1a

echo "${bold}
 ____  ____   ___  ____   ___  _     
| __ )| __ ) / _ \/ ___| / _ \| |    
|  _ \|  _ \| | | \___ \| | | | |    
| |_) | |_) | |_| |___) | |_| | |___ 
|____/|____/ \__\_\____/ \__\_\_____|
          
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
GITCLONEFUNC
GITRESET
GITSBMDLINIT

sudo rm -f /usr/local/bin/bbqsql
# fix error - "ImportError: No module named coros"
sed -i -e 's/from gevent.coros import Semaphore/from gevent.lock import Semaphore/g' $GITREPOROOT/bbqsql/lib/technique.py

sudo -H python setup.py install


#333d 
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

