#!/usr/bin/env bash

#Define on_picture_save routine for this module. Path to file is available through variable $1 and name of the camera through variable $2

echo "on_picture_save routine for Dropbox"
sudo /home/pi/pigeon/modules/dropbox/binaries/dropbox_uploader.sh -f /home/pi/pigeon/modules/dropbox/binaries/dropbox.conf upload $1 /$2/ && sudo rm -rf $1
