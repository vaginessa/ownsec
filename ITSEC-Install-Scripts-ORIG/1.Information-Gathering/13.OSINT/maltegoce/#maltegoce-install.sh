#!/bin/bash

#Location of the Git-Repository
BRANCH=master
DOWNLOADDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/maltegoce

cd $DOWNLOADDIR

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

wget https://www.paterva.com/malv4/community/MaltegoCE.v4.0.11.9358.deb -O MaltegoCE.v4.0.11.9358.deb

sudo dpkg -i MaltegoCE.v4.0.11.9358.deb