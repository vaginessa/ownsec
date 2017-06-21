#!/bin/bash
####################################################################
#### Welcome - letzs roll - FUCKYEAH :) ############################
####################################################################
#
# 
srcdPT2=/opt/ITSEC-Install-Scripts/0.Initial/src/PT2
chkdir=/opt/ITSEC-Install-Scripts/0.Initial/src
#
cd $srcdPT2
./1.DEB-Lists.sh
./2.Node-Npm.sh
#./3.replace-deb-w-dummy.sh
./4.IDE.sh
./5.Wifi-Firmware.sh
./6.Java-JDK-JRE.sh
./7.RBENV-RUBY.sh
./8.Postgres-MSF-DB.sh
./9.Virtualbox.sh
#./10.OpenSSL-1.1.0.sh doesent really work out of the box due to the system installed openssl depencies.
./11.Docker.sh
./12.usr_environment.sh
./13.dot.sh
#
#Calling the reboot-script to restart this script 
echo "#helloworld" > $chkdir/rebootchkPT2.txt

#reboot


