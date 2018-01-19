#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/DanMcInerney/wifijammer.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/wifijammer/DanMcInerney/wifijammer
GITCLONEDIR=/opt/ITSEC/6.Wireless/1.Wifi/3.Jammer/wifijammer/DanMcInerney
EXECUTEABLE1=wifijammer.py
EXECUTEABLE2=wifijammer
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/3.Jammer/wifijammer
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi/3.Jammer/wifijammer
DSKTPFL=wifijammer.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/6.Wireless/1.Wifi/3.Jammer/wifijammer
#ph1a

echo "${bold}
__        _____ _____ ___    _   _    __  __ __  __ _____ ____  
\ \      / /_ _|  ___|_ _|  | | / \  |  \/  |  \/  | ____|  _ \ 
 \ \ /\ / / | || |_   | |_  | |/ _ \ | |\/| | |\/| |  _| | |_) |
  \ V  V /  | ||  _|  | | |_| / ___ \| |  | | |  | | |___|  _ < 
   \_/\_/  |___|_|   |___\___/_/   \_\_|  |_|_|  |_|_____|_| \_\
            
INSTALL
${normal}"

#plh11
GITCLONEFUNC
GITSBMDLINIT

CHMODXEX1

SYMLINKEX2TO1
#333d
CPDESKTFL
