#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/sweetsoftware/ares
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/ares
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/ares/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor
DSKTPFL=ares.desktop
GITRESET () {
	git clean -f
	git fetch origin
	git reset --hard origin/$BRANCH
	git pull
}
APTLSTDIR=/opt/ITSEC-Install-Scripts/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}

echo "${bold}
    _    ____  _____ ____  
   / \  |  _ \| ____/ ___| 
  / _ \ | |_) |  _| \___ \ 
 / ___ \|  _ <| |___ ___) |
/_/   \_\_| \_\_____|____/ 
          
UPDATE
${normal}"

if [ ! -d $GITCONFDIR ]

then

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

else

echo "${bold}REPO EXISTS, skip clone...${normal}"

fi

cd $GITREPOROOT

if git checkout $BRANCH &&
    git fetch origin $BRANCH &&
    [ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
    git merge origin/$BRANCH
then
    
cd $GITREPOROOT

sudo apt-get install python-compizconfig binutils-mingw-w64 python-pil python-requests

cd $GITREPOROOT 
GITRESET
GITSBMDLINIT

####### SERVER

cd $GITREPOROOT 
git clone https://github.com/pyinstaller/pyinstaller
cd pyinstaller
GITRESET
GITSBMDLINIT
cd bootloader
python ./waf distclean all
cd ..
sudo python setup.py install
cd ..

cd $GITREPOROOT 

#git clone https://github.com/naihe2010/pyHook
#cd pyHook
#git clean -f
#git fetch origin
#git reset --hard origin/$BRANCH
#git pull
#git submodule init && git submodule update --recursive
#sudo python setup.py install
#cd ..
#


cd $GITREPOROOT 

#vim agent/python/settings.py

cd $GITREPOROOT 
cd server
#python db_init.py #init


cd $GITREPOROOT 
cd server 
#rm -f server.sh
#echo "#!/bin/bash

#cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/Ares/server
#python server.py" >> server.sh
#
#ln -s /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/Ares/server/server.sh /usr/local/bin/ares_server
# python server.py #run


#cd $GITREPOROOT 
#cd agent/python
#pyinstaller --onefile agent.py

cd $GITREPOROOT 

mkdir -p $DSKTPFLSDEST && cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

