#!/usr/bin/env bash

#Define on_movie_end routine
echo "on_movie_end routine for Dropbox for file " $1
sudo /home/pi/pigeon/modules/dropbox/binaries/dropbox_uploader.sh upload $1 /detections/ && rm -rf $1
