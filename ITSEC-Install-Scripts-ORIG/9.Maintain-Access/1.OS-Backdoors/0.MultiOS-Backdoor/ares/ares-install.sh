#!/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/sweetsoftware/ares
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware/ares
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares/sweetsoftware
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares
DSKTPFL=ares.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/ares
#ph1a

echo "${bold}
    _    ____  _____ ____  
   / \  |  _ \| ____/ ___| 
  / _ \ | |_) |  _| \___ \ 
 / ___ \|  _ <| |___ ___) |
/_/   \_\_| \_\_____|____/ 
          
INSTALL
${normal}"

#plh11
GITCLONEFUNC

### DEPS:
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python-compizconfig binutils-mingw-w64 python-pil python-requests


sudo apt-get update
sudo apt-get upgrade
xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-ares.txt") -r -- sudo apt-get install -y
### DEPS END

GITSBMDLINIT
####### SERVER

GITCLONEFUNC 
git clone https://github.com/pyinstaller/pyinstaller
cd pyinstaller
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
