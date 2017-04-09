#!/usr/bin/env bash

#Define on_movie_end routine for this module. Path to file is available through variable $1

echo "on_movie_end routine for Dropbox"
sudo /home/pi/pigeon/modules/dropbox/binaries/dropbox_uploader.sh upload $1 /detections/ && rm -rf $1
