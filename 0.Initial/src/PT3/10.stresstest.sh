#!/bin/bash

###############################################################################
######################   10.Stresstest   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/10.Stresstest/dhcpig
./dhcpig.sh #call w dhcPIG 
cd /opt/ITSEC-Install-Scripts/10.Stresstest/iax-flooder
./iax-flooder.sh #call w iaxfloof 
cd /opt/ITSEC-Install-Scripts/10.Stresstest/invite-flooder
./invite-flooder.sh 
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/pig
#./#pig.sh #disable for unknown reason, checking latr
cd /opt/ITSEC-Install-Scripts/10.Stresstest/rtp-flooder
./rtp-flooder.sh 
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/siege
#./#siege.sh #disabled die to build err, check back latr
cd /opt/ITSEC-Install-Scripts/10.Stresstest/slowhttptest
./slowhttptest.sh 
cd /opt/ITSEC-Install-Scripts/10.Stresstest/t50
./t50.sh
cd /opt/ITSEC-Install-Scripts/10.Stresstest/udpflooder
./udpflooder.sh
cd /opt/ITSEC-Install-Scripts/10.Stresstest/ufonet
./ufonet.sh