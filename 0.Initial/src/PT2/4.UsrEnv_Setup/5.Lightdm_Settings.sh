#!/bin/bash

# Copy Lightdm Configs
sudo cp /opt/ownsec/0.Initial/settings-scripts/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

sudo updatedb
sudo ldconfig