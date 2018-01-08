#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

REPOROOT=/opt/ownsec
SETTINGSCRIPTS=/0.Initial/settings-scripts
$BINDIR=/usr/local/bin

echo "${bold}
... copy XFCE Menu and Panel Setup ....         
${normal}"
cp -R $REPOROOT/0.Initial/usrlcl/.config /home/$USER



