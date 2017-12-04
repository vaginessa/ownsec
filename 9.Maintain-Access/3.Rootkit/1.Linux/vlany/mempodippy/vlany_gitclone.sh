#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/mempodippy/vlany
BRANCH=master
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/3.Rootkit/1.Kernel/1.Linux/vlany/mempodippy

echo "${bold}
__     ___        _    _   ___   __
\ \   / / |      / \  | \ | \ \ / /
 \ \ / /| |     / _ \ |  \| |\ V / 
  \ V / | |___ / ___ \| |\  | | |  
   \_/  |_____/_/   \_\_| \_| |_|  
                                   
GIT CLONE
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
