#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

GITREPO=https://github.com/evilsocket/bettercap.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/bettercap/evilsocket/bettercap
GITCLONEDIR=/opt/ITSEC/7.Mitm/bettercap/evilsocket
DSKTPFLS=/opt/ownsec/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=bettercap.desktop
APTLSTDIR=/opt/ownsec/0.Initial/lst/apt
GITSBMDLINIT () {
	git submodule init
	git submodule update --recursive
	sudo updatedb && sudo ldconfig
}
echo "${bold}
 ____  _____ _____ _____ _____ ____   ____    _    ____  
| __ )| ____|_   _|_   _| ____|  _ \ / ___|  / \  |  _ \ 
|  _ \|  _|   | |   | | |  _| | |_) | |     / _ \ | |_) |
| |_) | |___  | |   | | | |___|  _ <| |___ / ___ \|  __/ 
|____/|_____| |_|   |_| |_____|_| \_\\____/_/   \_\_|    
               
INSTALL
${normal}"

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO

echo "${bold}
gem install bundler            
${normal}"
gem install bundler

cd $GITREPOROOT

### DEPS:
## Installed w apt lists - see /opt/ownsec/0.Initial/lst/apt
# sudo apt-get update
# sudo apt-get upgrade
# xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-wireshark.txt") -r -- sudo apt-get install -y
### DEPS END

#. ~/.bashrc
#eval "$(rbenv init -)"
#yes "N" | rbenv install 2.4.1
#rbenv rehash
#rbenv shell 2.4.1
#sudo updatedb
#sudo ldconfig

GITSBMDLINIT

echo "${bold}
bundle update         
${normal}"
bundle update
echo "${bold}
bundle install         
${normal}"
bundle install
echo "${bold}
gem update          
${normal}"
gem update

echo "${bold}
gem build bettercap.gemspec          
${normal}"
gem build bettercap.gemspec


echo "${bold}
sudo gem install bettercap*.gem        
${normal}"

sudo gem install bettercap*.gem

#echo "${bold}
#test3            
#${normal}"
#rbenv sudo bettercap

echo "${bold}
cd to bin dir          
${normal}"
cd /opt/ITSEC/7.Mitm/bettercap/evilsocket/bettercap/bin/

echo "${bold}
write sh file to run with the desired rbenv ruby            
${normal}"
#echo '#!/bin/bash -i

#cd /opt/ITSEC/7.Mitm/bettercap/evilsocket/bettercap/bin

#source ~/.bashrc
#eval "$(rbenv init -)"
#rbenv shell 2.4.1
#ruby -v
#./bettercap $*
#' > bettercap.sh



#echo "${bold}
#chmod +x the sh file        
#${normal}"
#chmod +x bettercap.sh

#echo "${bold}
#rm the old usr bin link       
#${normal}"
#sudo rm -f /usr/local/bin/bettercap
#echo "${bold}
#symlink the sh file      
#${normal}"
#sudo ln -s /opt/ITSEC/7.Mitm/bettercap/evilsocket/bettercap/bin/bettercap.sh /usr/local/bin/bettercap

echo "${bold}
make desktop file dir      
${normal}"
mkdir -p $DSKTPFLSDEST
echo "${bold}
cp desktop files for the menu     
${normal}"
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

echo "${bold}
done running the bettercap setup   
${normal}"
