#!/bin/bash

# Copy Grub config and Update Grub
sudo cp /opt/ownsec/0.Initial/settings-scripts/grub /etc/default/grub
sudo update-grub
sudo updatedb
sudo ldconfig