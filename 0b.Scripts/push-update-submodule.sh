#!/bin/bash

# Update submodule && workdir repo
# Make changes on the submodule located in another git repository - push changes to remote  submodule && push submodule update to main repo.

GITREPOROOT=/opt/ownsec
SUBMODULE=/opt/ownsec/ITSEC-Install-Scripts-ORIG
SUBMODULENAME=ITSEC-Install-Scripts-ORIG
SUBMODULEBRANCH=ownsec-16.04_XFCE

cd $SUBMODULE

git add .
git commit -a -m "commit in submodule"
git push
cd $GITREPOROOT
git add $SUBMODULENAME
git commit -m "Updated submodule"
git push