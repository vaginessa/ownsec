#!/bin/bash
###############################
#
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
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/1.WEP_WPA/cowpatty
./cowpatty.sh
#
### 2.Local/HASHCAT ###
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/HASHCAT
./hashcat.sh

### 2.Local ###
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/johnny
./johnny.sh
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/johntheripper
./johntheripper.sh
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/ophcrack
./ophcrack.sh
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/pack
./pack.sh 
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/pyrit
./pyrit.sh 
#cd /opt/ITSEC-Install-Scripts/4.Password/2.Local
#./hashid.sh # empty output if no option def# building works #make: *** No rule to make target 'install'.  Stop.
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/rainbowcrack-ng
./rainbowcrack-ng.sh 

###############################################################################
######################   1.NET   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/brut3kit
./brut3kit.sh #PIP dependencies 
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/findmyhash
./findmyhash.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/f-scrack
./f-scrack.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/keimpx
./keimpx.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/medusa
./medusa.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/ncrack
./ncrack.sh
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/onesixtyone
./onesixtyone.sh 
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/patator
./patator.sh 
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network/thc-hydra
./thc-hydra.sh  
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network
./thc-pptp-bruter.sh  
#
###############################################################################
######################   3.Wordlist   ####################
###########################################################################
#### 2.Generator/2.Local/# #####
cd /opt/ITSEC-Install-Scripts/4.Password/3.Wordlist/crunch
./crunch_menu.sh # menu only #instaled w apt - build prob as i rememb
cd /opt/ITSEC-Install-Scripts/4.Password/3.Wordlist/rsmangler
./rsmangler.sh  
