#!/bin/bash
###############################
#
#########################################
######################   8.Forensics   #
#######################################
#
#
cd /opt/ITSEC-Install-Scripts/8.Forensics/0.Toolbox/sleuthkit

./sleuthkit-install.sh
cd /opt/ITSEC-Install-Scripts/8.Forensics/0.Toolbox/bulk_extractor
./bulk_extractor-install.sh
#./autopsy-install.sh #build fail #topsy/corelibs/SigarLoader.java:21: error: package com.sun.javafx does not exist

#