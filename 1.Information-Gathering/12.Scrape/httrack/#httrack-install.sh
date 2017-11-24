######
#!/bin/bash
#installed via apt- building problems


GITREPOROOT=/opt/ITSEC/1.Information-Gathering/12.Scrape/httrack/xroche/httrack
BRANCH=master
#EXECUTEABLE1=
#EXECUTEABLE2=
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout master &&
    git fetch origin master &&
    [ `git rev-list HEAD...origin/master --count` != 0 ] &&
    git merge origin/master
then
    
cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
sudo updatedb
sudo ldconfig
git clean -f
git fetch origin
git reset --hard origin/$BRANCH
git pull
git submodule init  
git submodule update --recursive
chmod +x $GITREPOROT/$EXECUTEABLE1
sudo ln -s $GITREPOROT/$EXECUTEABLE1 /usr/local/bin/$EXECUTEABLE2
fi