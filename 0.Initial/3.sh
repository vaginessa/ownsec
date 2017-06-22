#!/bin/bash
####################################################################
#### Welcome - letzs roll - FUCKYEAH :) ############################
####################################################################
#
# 
srcdPT3=/opt/ITSEC-Install-Scripts/0.Initial/src/PT3
chkdir=/opt/ITSEC-Install-Scripts/0.Initial/src

cd $srcdPT3
./1.Infogather.sh
./2.Vuln.sh
./3.Exploit.sh
./4.Password.sh
./5.Database.sh
./6.Wireless.sh
./7.Mitm.sh
./8.Tunnel
#./9.Forensics.sh

#Calling the reboot-script to restart this script 
#echo "#helloworld" > $chkdir/rebootchkPT3.txt


