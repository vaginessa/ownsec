#!/bin/bash
#NOT WORKING - NVIDIA ONLY

GITREPO=
BRANCH=master
GITREPOROOT=/opt/ITSEC/4.Password/2.Local/1.Brute/truecrack/lvaccaro/truecrack
GITCLONEDIR=
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/2.NVIDIA-ONLY/truecrack
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/2.Local/2.NVIDIA-ONLY/truecrack
DSKTPFL=truecrack.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password/2.Local/2.NVIDIA-ONLY/truecrack
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

#mkdir && clone 

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

GITSBMDLINIT
