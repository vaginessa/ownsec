#!/bin/bash
###############################
#
#########################################
######################   8.Forensics   #
#######################################
#
#
cd /opt/ITSEC-Install-Scripts/8.Forensics/0.Toolbox/sleuthkit

./sleuthkit.sh
cd /opt/ITSEC-Install-Scripts/8.Forensics/0.Toolbox/bulk_extractor
./bulk_extractor.sh
#./autopsy.sh #build fail #topsy/corelibs/SigarLoader.java:21: error: package com.sun.javafx does not exist

#