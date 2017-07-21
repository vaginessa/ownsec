#!/bin/bash
#NOT WORKING - NVIDIA ONLY

GITREPOROOT=/opt/ITSEC/4.Password/2.Local/1.Brute/truecrack/lvaccaro/truecrack
GITREPOGITFILE=$GITREPOROOT/.git
if [ ! -d $GITREPOGITFILE ]

then

#mkdir && clone 

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT

git clean -f 
git fetch origin
git reset --hard origin/master
git pull

fi
