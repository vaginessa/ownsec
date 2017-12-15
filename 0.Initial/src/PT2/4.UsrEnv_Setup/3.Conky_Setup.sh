#!/bin/bash

sudo sh -c "echo '/usr/local/lib' >> /etc/ld.so.conf"
cp -R $REPOROOT/0.Initial/usrlcl/.conky .conky
sudo rm -f $BINDIR/conky_*
cd $REPOROOT/0.Initial/settings-scripts/startstop/0.Services/5.CONKY
sudo bash -c 'for SHfiles in $(ls *.sh); do ln -s $REPOROOT/0.Initial/settings-scripts/startstop/0.Services/5.CONKY/$SHfiles $BINDIR/$SHfiles;done'

# menu file(s) already copied in /opt/ITSEC-Install-Scripts/0.Initial/src/PT2/4.UsrEnv_Setup/1.Symlinks_Setup.sh