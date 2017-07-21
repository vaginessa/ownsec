#!/bin/bash
#NOT WORKING - NVIDIA ONLY
GITREPOGITFILE=$GITREPOROOT/.git
cd /opt/ITSEC/4.Password/2.Local/1.Brute/truecrack/lvaccaro/truecrack/

git clean -f 
git fetch origin
git reset --hard origin/master
git pull