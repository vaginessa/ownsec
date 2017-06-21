#!/bin/bash

cd /opt/ITSEC-Install-Scripts/0.Initial/tmp/


#equivs-control aircrack
#mousepad aircrack
echo "
Section: misc
Priority: optional
Standards-Version: 1:1.2-0~beta3-4

Package: aircrack-ng
Version: 1:1.2-0~beta3-4
Section: dummx
Maintainer: dummy
Provides: dummy
Architecture: all
Description: Dummy aircrack package
" > aircrack-ng

sudo equivs-build aircrack-ng
sudo dpkg -r --force-depends aircrack-ng
sudo dpkg -i aircrack-ng_1.2-0~beta3-4_all.deb

