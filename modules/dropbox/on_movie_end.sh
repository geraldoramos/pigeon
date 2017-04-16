#!/usr/bin/env bash

#Define on_movie_end routine for this module. Path to file is available through variable $1 and name of the camera through variable $2

echo "on_movie_end routine for Dropbox"
echo $1 $2
sudo '/home/pi/pigeon/modules/dropbox/binaries/dropbox_uploader.sh upload' $1 '/'$2 && rm -rf $1
