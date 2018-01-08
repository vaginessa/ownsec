#!/bin/bash
###############################
BASEDIR=/opt/ownsec/6.Wireless
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
cd $BASEDIR/1.Wifi/1.WPS/pixiewps
./pixiewps-install.sh
cd $BASEDIR/1.Wifi/1.WPS/bully
./bully-install.sh
cd $BASEDIR/1.Wifi/1.WPS/reaver-wps
./reaver-wps-install.sh  
#
#
###############################################################################
######################   1.Wifi/2.Routerkeys   ####################
###########################################################################
cd $BASEDIR/1.Wifi/2.Routerkeys/routerkeygenpc
./routerkeygenpc-install.sh # github username pass prompt during install
#
#
###############################################################################
######################   1.Wifi/3.Jammer   ####################
###########################################################################
cd $BASEDIR/1.Wifi/3.Jammer/md3-$BRANCH
./md3-$BRANCH-install.sh #alternate git vers by camerony
cd $BASEDIR/1.Wifi/3.Jammer/wifijammer
./wifijammer-install.sh 
#
#
###############################################################################
######################   1.Wifi/4.Evil-Twin   ####################
###########################################################################

# didnt look much into it yet, needs more work mst probly.
#./#hostapd-mana-install.sh 
cd $BASEDIR/1.Wifi/4.Evil-Twin/hostapd-wpe
./hostapd-wpe-install.sh
#######################################################
######################   1.Wifi MAIN   ###############
#####################################################
cd $BASEDIR/1.Wifi/aircrack-ng
./aircrack-ng-install.sh
cd $BASEDIR/1.Wifi/atear
./atear-install.sh #PIP deps
cd $BASEDIR/1.Wifi/eapmd5pass
./eapmd5pass-install.sh
cd $BASEDIR/1.Wifi/evilgrade
./evilgrade-install.sh
cd $BASEDIR/1.Wifi/fern-wifi-cracker
./fern-wifi-cracker-install.sh

 #install last # needs fixes.
#kismet config last line remove dash end of path.
cd $BASEDIR/1.Wifi/kismet
./kismet-install.sh #needs check
cd $BASEDIR/1.Wifi/wifi-pumpkin
./wifi-pumpkin #depends openssl 1.1
cd $BASEDIR/1.Wifi/fruitywifi
./fruitywifi-install.sh  # install last
cd $BASEDIR/1.Wifi/airgeddon
./airgeddon-install.sh #install last
cd $BASEDIR/1.Wifi/aircrack
./aircrack-install.sh # install last
###################################################################################
###################### WIFI END





