#!/usr/bin/env bash

#Define on_picture_save routine

echo "on_picture_save routine for Dropbox"
sudo /home/pi/pigeon/modules/dropbox/binaries/dropbox_uploader.sh upload $1 /detections/ && rm -rf $1
