#!/bin/bash
###############################
BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel
####################################
######################   8.Tunnel  #
##################################
#cd $BASEDIR/anonym8
#./anonym8-install.sh
cd $BASEDIR/dns2tcp
./dns2tcp-install.sh
cd $BASEDIR/iodine
./iodine-install.sh
#cd $BASEDIR/mallory
#mallory-install.sh
#cd $BASEDIR/miredo
#miredo-install.sh
cd $BASEDIR/proxychains-ng
./proxychains-ng-install.sh
#cd $BASEDIR/proxytunnel
#proxytunnel-install.sh
cd $BASEDIR/ptunnel
./ptunnel-install.sh
cd $BASEDIR/pwnat
./pwnat-install.sh
cd $BASEDIR/sslh
./sslh-install.sh
#cd $BASEDIR/stunnel
#stunnel-install.sh
cd $BASEDIR/udptunnel
./udptunnel-install.sh