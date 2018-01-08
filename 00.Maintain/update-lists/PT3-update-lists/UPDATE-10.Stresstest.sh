#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

BASEDIR=/opt/ownsec/10.Stresstest

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

10.Stresstest
${normal}"

cd $BASEDIR/dhcpig
./dhcpig-update.sh
#not a git repo
#cd $BASEDIR/iax-flooder
#./
#not a git repo
#cd $BASEDIR/invite-flooder/
#./
# not working
#cd $BASEDIR/pig/
#./
# not a git repo 
#cd $BASEDIR/rtp-flooder
#./
# greyd out for some unknown reason - check again
#cd $BASEDIR/siege
#./
#cd $BASEDIR/slowhttptest
#./slowhttptest-update.sh #build fail
#cd $BASEDIR/t50
#./t50-update.sh #build fail
# not a git repo
#cd $BASEDIR/udpflooder
#./
echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
10.Stresstest
${normal}"