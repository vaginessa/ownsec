#!/bin/bash
###############################

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/4.Password
#######################################
######################   4.Password  #
######################################
#
#
###############################################################################
######################   2.Local   ####################
###########################################################################
#
### 2.Local/1.WEP_WPS ###
cd $BASEDIR/2.Local/1.WEP_WPA/cowpatty
./cowpatty-install.sh
#
### 2.Local/HASHCAT ###
cd $BASEDIR/2.Local/HASHCAT
./hashcat-install.sh

### 2.Local ###
cd $BASEDIR/2.Local/johnny
./johnny-install.sh
cd $BASEDIR/2.Local/johntheripper
./johntheripper-install.sh
cd $BASEDIR/2.Local/ophcrack
./ophcrack-install.sh
cd $BASEDIR/2.Local/pack
./pack-install.sh 
cd $BASEDIR/2.Local/pyrit
./pyrit-install.sh 
#cd $BASEDIR/2.Local
#./hashid-install.sh # empty output if no option def# building works #make: *** No rule to make target 'install'.  Stop.
cd $BASEDIR/2.Local/rainbowcrack-ng
./rainbowcrack-ng-install.sh 

###############################################################################
######################   1.NET   ####################
###########################################################################
cd $BASEDIR/1.Network/brut3kit
./brut3kit-install.sh #PIP dependencies 
cd $BASEDIR/1.Network/findmyhash
./findmyhash-install.sh
cd $BASEDIR/1.Network/f-scrack
./f-scrack-install.sh
cd $BASEDIR/1.Network/keimpx
./keimpx-install.sh
cd $BASEDIR/1.Network/medusa
./medusa-install.sh
cd $BASEDIR/1.Network/ncrack
./ncrack-install.sh
cd $BASEDIR/1.Network/onesixtyone
./onesixtyone-install.sh 
cd $BASEDIR/1.Network/patator
./patator-install.sh 
cd $BASEDIR/1.Network/thc-hydra
./thc-hydra-install.sh  
cd $BASEDIR/1.Network
./thc-pptp-bruter-install.sh  
#
###############################################################################
######################   3.Wordlist   ####################
###########################################################################
#### 2.Generator/2.Local/# #####
cd $BASEDIR/3.Wordlist/crunch
./crunch_menu-install.sh # menu only #instaled w apt - build prob as i rememb
cd $BASEDIR/3.Wordlist/rsmangler
./rsmangler-install.sh  
