#!/bin/bash

# Update submodule && workdir repo
# Update the submodule to its latest commit 

GITREPOROOT=/opt/ownsec
SUBMODULE=/opt/ownsec/ITSEC-Install-Scripts-ORIG
SUBMODULENAME=ITSEC-Install-Scripts-ORIG
SUBMODULEBRANCH=ownsec-16.04_XFCE


cd $GITREPOROOT
git submodule init && git submodule update --recursive

cd $SUBMODULE

git checkout $SUBMODULEBRANCH

cd $GITREPOROOT
git add .
git commit "submodule updates"
git push