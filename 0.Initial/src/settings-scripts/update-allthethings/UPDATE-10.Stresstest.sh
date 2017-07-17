#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _   _ ____  ____    _  _____ _____ 
| | | |  _ \|  _ \  / \|_   _| ____|
| | | | |_) | | | |/ _ \ | | |  _|  
| |_| |  __/| |_| / ___ \| | | |___ 
 \___/|_|   |____/_/   \_\_| |_____|

10.Stresstest
${normal}"

cd /opt/ITSEC-Install-Scripts/10.Stresstest/dhcpig
./dhcpig-update.sh
#not a git repo
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/iax-flooder
#./
#not a git repo
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/invite-flooder/
#./
# not working
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/pig/
#./
# not a git repo 
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/rtp-flooder
#./
# greyd out for some unknown reason - check again
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/siege
#./
cd /opt/ITSEC-Install-Scripts/10.Stresstest/slowhttptest
./slowhttptest-update.sh
cd /opt/ITSEC-Install-Scripts/10.Stresstest/t50
./t50-update.sh
# not a git repo
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/udpflooder
#./
echo "${bold}
 ____   ___  _   _ _____ 
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|  
| |_| | |_| | |\  | |___ 
|____/ \___/|_| \_|_____|
              
10.Stresstest
${normal}"