#!/bin/bash

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/4.Password/3.Wordlist/
DSKTPFLSDEST=/home/$USER/.local/share/applications/4.Password/3.Wordlist
DSKTPFL=crunch.desktop

mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

