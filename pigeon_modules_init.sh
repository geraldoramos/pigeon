#!/usr/bin/env bash

# This will run module-specific routines
# Receives the type of argument to run (ex: install, on_movie_end or on_picture_save).

echo "Starting Modules Script"

camera_name=pigeon

for d in modules/*/ ; do

  if [[ $1 == 'install' ]]
    then
    echo -n "Do you want install $d ? [y/N]"
    read install
      if [[ $install == "y" ]] || [[ $install == "Y" ]] || [[ $intall == "Yes" ]] || [[ $install == "yes" ]]
        then
        sudo chmod +x '/home/pi/pigeon/'$d$1'.sh'
        sudo '/home/pi/pigeon/'$d$1'.sh'
        fi
  else
  sudo chmod +x '/home/pi/pigeon/'$d$1'.sh'
  sudo '/home/pi/pigeon/'$d$1'.sh' $2 $camera_name
  fi

done
