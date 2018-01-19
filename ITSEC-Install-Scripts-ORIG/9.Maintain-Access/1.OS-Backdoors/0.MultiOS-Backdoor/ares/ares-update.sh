#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/sweetsoftware/ares
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/ares
GITCONFDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/ares/.git
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares
DSKTPFL=ares.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares
#hd6cv

echo "${bold}
    _    ____  _____ ____  
   / \  |  _ \| ____/ ___| 
  / _ \ | |_) |  _| \___ \ 
 / ___ \|  _ <| |___ ___) |
/_/   \_\_| \_\_____|____/ 
          
UPDATE
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC

sudo apt-get install python-compizconfig binutils-mingw-w64 python-pil python-requests

GITCLONEFUNC 
GITRESET
GITSBMDLINIT

####### SERVER

GITCLONEFUNC 
git clone https://github.com/pyinstaller/pyinstaller
cd pyinstaller
GITRESET
GITSBMDLINIT
cd bootloader
python ./waf distclean all
cd ..
sudo python setup.py install
cd ..

GITCLONEFUNC 

#git clone https://github.com/naihe2010/pyHook
#cd pyHook
#git clean -f
#git fetch origin
#ddddf4
#git pull
##56gd && #58gd
#sudo python setup.py install
#cd ..
#


GITCLONEFUNC 

#vim agent/python/settings.py

GITCLONEFUNC 
cd server
#python db_init.py #init


GITCLONEFUNC 
cd server 
#rm -f server.sh
#echo "#!/bin/bash

#cd /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/Ares/server
#python server.py" >> server.sh
#
#ln -s /opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/Ares/server/server.sh /usr/local/bin/ares_server
# python server.py #run


#plh11 
#cd agent/python
#pyinstaller --onefile agent.py

GITCLONEFUNC 

#333d && CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

