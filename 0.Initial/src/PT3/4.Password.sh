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
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/1.WEP_WPA
./cowpatty.sh
#
### 2.Local/HASHCAT ###
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local/HASHCAT
./hashcat.sh

### 2.Local ###
cd /opt/ITSEC-Install-Scripts/4.Password/2.Local
./johnny.sh 
./johntheripper.sh
./ophcrack.sh #works but had to remove libqwt-dev for libqwt5-qt4-dev hope nothing else broke. # building works #make: *** No rule to make target 'install'.  Stop.
./pack.sh 
./pyrit.sh 
./hashid.sh # empty output if no option def# building works #make: *** No rule to make target 'install'.  Stop.
./rainbowcrack-ng.sh 

###############################################################################
######################   1.NET   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/4.Password/1.Network
./brut3kit.sh #PIP dependencies 
./findmyhash.sh 
./f-scrack.sh 
#./keimpx.sh
./medusa.sh 
./onesixtyone.sh #check install again on blank os.#make: *** No rule to make target 'install'.  Stop. 
./patator.sh #pyOpenSSL is not installed, can't continue #worked prev. PIP clstrfk
./thc-hydra.sh  
#./thc-pptp-bruter.sh  
#
###############################################################################
######################   3.Wordlist   ####################
###########################################################################
#### 2.Generator/2.Local/# #####
cd /opt/ITSEC-Install-Scripts/4.Password/3.Wordlist/2.Generator/2.Local/
./crunch_menu.sh # menu only #instaled w apt - build prob as i rememb
./rsmangler.sh  
