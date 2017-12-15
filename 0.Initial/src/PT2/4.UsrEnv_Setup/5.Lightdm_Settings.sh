#!/bin/bash

# Copy Lightdm Configs
sudo cp /opt/ITSEC-Install-Scripts/0.Initial/settings-scripts/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

sudo updatedb
sudo ldconfig