#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

echo "${bold}
  ____ ____  _   _ _   _  ____ _   _     __  __ _____ _   _ _   _ 
 / ___|  _ \| | | | \ | |/ ___| | | |   |  \/  | ____| \ | | | | |
| |   | |_) | | | |  \| | |   | |_| |   | |\/| |  _| |  \| | | | |
| |___|  _ <| |_| | |\  | |___|  _  |   | |  | | |___| |\  | |_| |
 \____|_| \_\\___/|_| \_|\____|_| |_|___|_|  |_|_____|_| \_|\___/ 
                                   |_____|            
${normal}"

DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/3.Wordlist/crunch
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist/crunch
DSKTPFL=crunch.desktop

#333d
CPDESKTFL

