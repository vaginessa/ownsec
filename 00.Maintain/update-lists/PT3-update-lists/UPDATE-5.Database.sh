#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

BASEDIR=/opt/ownsec/5.Database

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

5.Database
${normal}"

################## 5.Database##################

# dont remember what the issue was, nees check again.
#cd /opt/ownsec/5.Database/1.SQL/bbqsql
#./bbsql-update.sh



cd $BASEDIR/1.SQL/sqlmap
./sqlmap-update.sh

echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
5.Database
${normal}"