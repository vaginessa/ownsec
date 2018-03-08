#!/bin/bash
###############################
BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/12.Forensics
#########################################
######################   8.Forensics   #
#######################################
#
#
cd $BASEDIR/0.Toolbox/sleuthkit
./sleuthkit-install.sh
cd $BASEDIR/0.Toolbox/bulk_extractor
./bulk_extractor-install.sh
#./autopsy-install.sh #build fail #topsy/corelibs/SigarLoader.java:21: error: package com.sun.javafx does not exist

#