#!/bin/bash
###############################
BASEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/5.Database
########################################
######################   5.Database   #
######################################
#
#
###############################################################################
######################   1.SQL   ####################
###########################################################################
cd $BASEDIR/1.SQL/sqlmap
./sqlmap-install.sh
cd $BASEDIR/1.SQL/hexorbase
./hexorbase-install.sh
###./bbqsql-install.sh outdated, bugs ,,,,