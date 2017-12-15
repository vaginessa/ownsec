#!/bin/bash -i

bold=$(tput bold)
normal=$(tput sgr0)

# maindir
srcdPT2=/opt/ITSEC-Install-Scripts/0.Initial/src/PT2
#chkdir=/opt/ITSEC-Install-Scripts/0.Initial/src

# 1st category dirs
DEPS_INST=/opt/ITSEC-Install-Scripts/0.Initial/src/PT2/1.Deps_Install
FIRMWARE_INST=/opt/ITSEC-Install-Scripts/0.Initial/src/PT2/2.Firmware_Install
USRAPP_INST=/opt/ITSEC-Install-Scripts/0.Initial/src/PT2/3.UsrApp_Install
USRENV_SETUP=/opt/ITSEC-Install-Scripts/0.Initial/src/PT2/4.UsrEnv_Setup

# 2nd category dirs
FIRMWARE_WIFI_INST=/opt/ITSEC-Install-Scripts/0.Initial/src/PT2/2.Firmware_Install/1.Wifi


echo "${bold}
 ____   _    ____ _____ ____  
|  _ \ / \  |  _ \_   _|___ \ 
| |_) / _ \ | |_) || |   __) |
|  __/ ___ \|  _ < | |  / __/ 
|_| /_/   \_\_| \_\|_| |_____|
                              
INSTALL DEPENDENCIES, USRAPPSapps & USR ENV
${normal}"

##################################################################################################
### Install Dependencies from Package-Manager Lists & Sources

echo "${bold}
cd /opt/ITSEC-Install-Scripts/0.Initial/src/PT2/1.Deps_Install    
${normal}"
cd $DEPS_INST

#### Package-Manager Lists First ( No all dependencies but also baseapps - see the lists for main)
echo "${bold}
./1.Package-Mgr_Lists_Install.sh 
${normal}"
./1.Package-Mgr_Lists_Install.sh

#### Install Node & NPM off Github
# [DISABLED FOR NVM bec of speed}
#echo "${bold}
#./2.Node-Npm_Install_GitHub.sh  
#${normal}"
#./2.Node-Npm_Install_GitHub.sh

#### Install Node & NPM w NVM off Github
echo "${bold}
./2.NVM_Install_GitHub.sh
${normal}"
./2.NVM_Install_GitHub.sh
#### Added NVM script to run node as sudo is required - however - havent tested it on a blanc install yet.
#### - so node git stays as install, could be possible that the script doesent run through as it requires a new terminal for part 2 of the script.
#### however, installing NVM is significantly faster than installing node from source on git.
#### I want either git or NVM as flixibility on versions is a nice thing. Ill maybe write a script later to do the same with node / npm build sources from their websites.
#### Comment out Node and ucomment NVM for a try 
#### to wipe the nvm install do
#### sudo rm -f /usr/local/bin/node
#### sudo rm -f /usr/local/bin/npm
#### sudo rm -fr /opt/DEPS/nvm
#### manually delete /home/$USER | .bashrc entry of nvm
#### after this you can run the node git install script or install the source off their site ...

#### Install Java JRE & JDK from Source off http://download.java.net
echo "${bold}
./3.Java-JDK-JRE_Install.sh
${normal}"
./3.Java-JDK-JRE_Install.sh

#### Install Rbenv for Ruby off Github
echo "${bold}
./4.Rbenv-Ruby_Install_GitHub.sh
${normal}"
./4.Rbenv-Ruby_Install_GitHub.sh
source ~/.bashrc
RUBYVERSION=$(lynx --dump https://raw.githubusercontent.com/rapid7/metasploit-framework/$BRANCH/.ruby-version )

rbenv install $RUBYVERSION
rbenv rehash

#### Install GO from off ppa:gophers/archive
echo "${bold}
./5.GO-gophers-apt-Install.sh
${normal}"
./5.GO-gophers-apt-Install.sh

#### [INCOMPLETE] Mysql - PHPmyadmin Install
#echo "${bold}
#./6.Mysql-PHPmyadmin_Install.sh
#${normal}"
#./6.Mysql-PHPmyadmin_Install.sh

#### Setup PSQL Metasploit-Framework Database
echo "${bold}
./7.Psql-MsfDB-Setup.sh
${normal}"
./7.Psql-MsfDB-Setup.sh

##################################################################################################
### Install Firmware

#### Install Wifi Firmware
echo "${bold}
cd /opt/ITSEC-Install-Scripts/0.Initial/src/PT2/2.Firmware_Install/1.Wifi 
${normal}"
cd $FIRMWARE_WIFI_INST

#### Install RTL_8812 from aircrack-ng off Github
echo "${bold}
./1.RTL_8812_Install.sh
${normal}"
./1.RTL_8812_Install.sh

#### Install RTL_8812 from aircrack-ng off Github
echo "${bold}
./2.RTL_8192_Install.sh
${normal}"
./2.RTL_8192_Install.sh



##################################################################################################
### Install 3.UsrApp_Install Scripts - /opt/ITSEC-Install-Scripts/0.Initial/src/PT2/3.UsrApp_Install
echo "${bold}
cd /opt/ITSEC-Install-Scripts/0.Initial/src/PT2/3.UsrApp_Install
${normal}"
cd $USRAPP_INST

#### Install IDE's
#
#echo "${bold}
#./1.IDE_Install.sh
#${normal}"
#./1.IDE_Install.sh

#### Install Virtualbox ppa
echo "${bold}
./2.Virtualbox_Install.sh
${normal}"
./2.Virtualbox_Install.sh

#### Install Docker ppa
echo "${bold}
./3.Docker_Install.sh
${normal}"
./3.Docker_Install.sh

#### Install Tor
echo "${bold}
./4.Tor_Install.sh
${normal}"
./4.Tor_Install.sh



##################################################################################################
### Install 4.UsrEnv_Setup Scripts - /opt/ITSEC-Install-Scripts/0.Initial/src/PT2/4.UsrEnv_Setup
echo "${bold}
cd /opt/ITSEC-Install-Scripts/0.Initial/src/PT2/4.UsrEnv_Setup
${normal}"
cd $USRENV_SETUP

#### Services Symlink & XFCE menu .desktop files copy
echo "${bold}
./1.Symlinks_Setup.sh
${normal}"
./1.Symlinks_Setup.sh

#### XFCE - copy rest of the configs, Menu file, Panel - everything dotfile
echo "${bold}
./2.XFCE_Setup.sh
${normal}"
./2.XFCE_Setup.sh

#### Conky - copy conky configs
echo "${bold}
./3.Conky_Setup.sh
${normal}"
./3.Conky_Setup.sh

#### Bash-git-prompt - Install
echo "${bold}
./4.Bash-git-prompt_Install.sh
${normal}"
./4.Bash-git-prompt_Install.sh

#### Lightdm_Settings - copy/set settings for Lightm
echo "${bold}
./5.Lightdm_Settings.sh
${normal}"
./5.Lightdm_Settings.sh

#### Grub_Settings - copy/set settings for Grub
echo "${bold}
./6.Grub_Settings.sh
${normal}"
./6.Grub_Settings.sh


##################################################################################################
### Show Version Info for quick O.K check

sudo updatedb
sudo ldconfig
source ~/.bashrc

node -v
npm -v
ruby -v
rbenv -v
rbenv local $RUBYVERSION
rbenv local
rbenv global $RUBYVERSION
rbenv global
docker -v 
java -version
#exit 0
echo "${bold}
Done, reboot now         
${normal}"
#Calling the reboot-script to restart this script 
#echo "#helloworld" > $chkdir/rebootchkPT2.txt

#reboot


