#!/bin/bash
###############################
#
########################################
######################   6.Wireless   #
######################################
#
#
#######################################################
######################   1.Wifi   ####################
#####################################################
#
#
###############################################################################
######################   1.WPS   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/1.WPS
./pixiewps.sh  
./bully.sh  
./reaver-wps.sh  
#
#
###############################################################################
######################   1.Wifi/2.Routerkeys   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/2.Routerkeys
./routerkeygenpc.sh # github username pass prompt during install
#
#
###############################################################################
######################   1.Wifi/3.Jammer   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/3.Jammer/
./md3-master.sh #alternate git vers by camerony 
./wifijammer.sh 
#
#
###############################################################################
######################   1.Wifi/4.Evil-Twin   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/4.Evil-Twin
# didnt look much into it yet, needs more work mst probly.
#./#hostapd-mana.sh 
./hostapd-wpe.sh
#######################################################
######################   1.Wifi MAIN   ###############
#####################################################
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi
./aircrack.sh 
./atear.sh #PIP deps 
./eapmd5pass.sh 
./evilgrade.sh 
./fern-wifi-cracker.sh
 #install last # needs fixes.
#kismet config last line remove dash end of path.
./kismet.sh #needs check
#./wifi-pumpkin depends openssl 1.1
./fruitywifi.sh 
###################################################################################
###################### WIFI END





