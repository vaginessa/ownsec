#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
  ____ ____  _   _ _   _  ____ _   _     __  __ _____ _   _ _   _ 
 / ___|  _ \| | | | \ | |/ ___| | | |   |  \/  | ____| \ | | | | |
| |   | |_) | | | |  \| | |   | |_| |   | |\/| |  _| |  \| | | | |
| |___|  _ <| |_| | |\  | |___|  _  |   | |  | | |___| |\  | |_| |
 \____|_| \_\\___/|_| \_|\____|_| |_|___|_|  |_|_____|_| \_|\___/ 
                                   |_____|            
${normal}"

DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/4.Password/3.Wordlist/
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist
DSKTPFL=crunch.desktop

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

