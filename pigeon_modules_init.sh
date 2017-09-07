#!/usr/bin/env bash

# This will run module-specific routines
# Receives the type of argument to run (ex: install, on_movie_end or on_picture_save).

echo "Starting Modules Script"

camera_name=pigeon
conf_file=/home/pi/pigeon/modules_enabled.conf

for d in modules/*/ ; do

  if [[ $1 == 'install' ]]
    then
    echo -n "Do you want install $d ? [y/N]"
    read install
      if [[ $install == "y" ]] || [[ $install == "Y" ]] || [[ $intall == "Yes" ]] || [[ $install == "yes" ]]
        then
        sudo chmod +x '/home/pi/pigeon/'$d$1'.sh'
        sudo '/home/pi/pigeon/'$d$1'.sh'
        echo $d >> $conf_file
        fi
  elif [[ $1 == "on_movie_end" ]] || [[ $1 == "on_picture_save" ]]
    then
    if grep -Fxq "$d" $conf_file
      then
      sudo chmod +x '/home/pi/pigeon/'$d$1'.sh'
      sudo '/home/pi/pigeon/'$d$1'.sh' $2 $camera_name
      echo "Finished $1 routine for $d"
      fi
  else
    echo "$1 is not a recognized command"    
  fi

done

echo "Ended Modules Script" 
