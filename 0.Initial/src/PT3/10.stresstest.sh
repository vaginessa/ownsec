#!/bin/bash

BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest
###############################################################################
######################   10.Stresstest   ####################
###########################################################################
cd $BASEDIR/dhcpig
./dhcpig-install.sh#call w dhcPIG 
cd $BASEDIR/iax-flooder
./iax-flooder-install.sh#call w iaxfloof 
cd $BASEDIR/invite-flooder
./invite-flooder-install.sh
#cd $BASEDIR/pig
#./#pig-install.sh#disable for unknown reason, checking latr
cd $BASEDIR/rtp-flooder
./rtp-flooder-install.sh
#cd $BASEDIR/siege
#./#siege-install.sh#disabled die to build err, check back latr
#cd $BASEDIR/slowhttptest
#./slowhttptest-install.sh#build fail
#cd $BASEDIR/t50
#./t50-install.sh#build fail
cd $BASEDIR/udpflooder
./udpflooder.sh
cd $BASEDIR/ufonet
./ufonet.sh