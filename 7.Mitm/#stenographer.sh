#!bin/bash
#stenographer.go:31:2: cannot find package "github.com/google/stenographer/env" in any of:
#	/usr/lib/go-1.6/src/github.com/google/stenographer/env (from $GOROOT)
#	($GOPATH not set)

GITREPOROOT=/opt/ITSEC/7.Mitm/7.Mitm/stenographer/google/stenographer

cd $GITREPOROOT
sudo rm /usr/local/bin/$EXECUTEABLE2
make clean
sudo updatedb
sudo ldconfig
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive
sudo ./install.sh