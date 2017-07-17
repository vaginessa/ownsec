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
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/1.WPS/pixiewps
./pixiewps.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/1.WPS/bully
./bully.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/1.WPS/reaver-wps
./reaver-wps.sh  
#
#
###############################################################################
######################   1.Wifi/2.Routerkeys   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/2.Routerkeys/routerkeygenpc
./routerkeygenpc.sh # github username pass prompt during install
#
#
###############################################################################
######################   1.Wifi/3.Jammer   ####################
###########################################################################
#cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/3.Jammer/md3-master
#./md3-master.sh #alternate git vers by camerony
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/3.Jammer/wifijammer
./wifijammer.sh 
#
#
###############################################################################
######################   1.Wifi/4.Evil-Twin   ####################
###########################################################################

# didnt look much into it yet, needs more work mst probly.
#./#hostapd-mana.sh 
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/4.Evil-Twin/hostapd-wpe
./hostapd-wpe.sh
#######################################################
######################   1.Wifi MAIN   ###############
#####################################################
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/aircrack-ng
./aircrack-ng.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/atear
./atear.sh #PIP deps
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/eapmd5pass
./eapmd5pass.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/evilgrade
./evilgrade.sh
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/fern-wifi-cracker
./fern-wifi-cracker.sh

 #install last # needs fixes.
#kismet config last line remove dash end of path.
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/kismet
./kismet.sh #needs check
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/wifi-pumpkin
./wifi-pumpkin #depends openssl 1.1
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/fruitywifi
./fruitywifi.sh  # install last
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/airgeddon
./airgeddon.sh #install last
cd /opt/ITSEC-Install-Scripts/6.Wireless/1.Wifi/aircrack
./aircrack.sh # install last
###################################################################################
###################### WIFI END





