#!/bin/bash

###############################################################################
######################   10.Stresstest   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/10.Stresstest/
./dhcpig.sh #call w dhcPIG 
./iax-flooder.sh #call w iaxfloof 
./invite-flooder.sh 
#./#pig.sh #disable for unknown reason, checking latr
./rtp-flooder.sh 
#./#siege.sh #disabled die to build err, check back latr
./slowhttptest.sh 
./t50.sh 
./udpflooder.sh 
./ufonet.sh