#!/bin/bash

###############################################################################
######################   10.Stresstest   ####################
###########################################################################
cd /opt/ITSEC-Install-Scripts/10.Stresstest/dhcpig
./dhcpig-install.sh#call w dhcPIG 
cd /opt/ITSEC-Install-Scripts/10.Stresstest/iax-flooder
./iax-flooder-install.sh#call w iaxfloof 
cd /opt/ITSEC-Install-Scripts/10.Stresstest/invite-flooder
./invite-flooder-install.sh
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/pig
#./#pig-install.sh#disable for unknown reason, checking latr
cd /opt/ITSEC-Install-Scripts/10.Stresstest/rtp-flooder
./rtp-flooder-install.sh
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/siege
#./#siege-install.sh#disabled die to build err, check back latr
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/slowhttptest
#./slowhttptest-install.sh#build fail
#cd /opt/ITSEC-Install-Scripts/10.Stresstest/t50
#./t50-install.sh#build fail
cd /opt/ITSEC-Install-Scripts/10.Stresstest/udpflooder
./udpflooder.sh
cd /opt/ITSEC-Install-Scripts/10.Stresstest/ufonet
./ufonet.sh