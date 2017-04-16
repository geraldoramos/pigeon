#!/usr/bin/env bash

# Define the installation routine for this module
echo "Installing Dropbox"
sudo ./modules/dropbox/binaries/dropbox_uploader.sh -f /home/pi/pigeon/modules/dropbox/binaries/dropbox.conf
