######
#!/bin/bash
#installed via apt- building problems

mkdir -p /opt/ITSEC/1.Information-Gathering/12.Scrape/httrack/xroche
cd /opt/ITSEC/1.Information-Gathering/12.Scrape/httrack/xroche
git clone https://github.com/xroche/httrack.git


sudo updatedb
sudo ldconfig

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/12.Scrape/httrack/xroche/httrack
GITREPOGITFILE=$GITREPOROOT/.git
#EXECUTEABLE1=
#EXECUTEABLE2=

cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init  
git submodule update --recursive
chmod +x $GITREPOROT/$EXECUTEABLE1
sudo ln -s $GITREPOROT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
