#!/usr/bin/env bash
#
# Installation script
#
# Pigeon - Open-source cloud camera
# http://github.com/geraldoramos/pigeon
# Download 3D printing (STL) files on http://www.thingiverse.com/thing:2230707
#
# Copyright (C) 2010-2017 Geraldo Ramos <geraldorneto@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

CONF='pigeon.conf'
MODULES='pigeon_modules_init.sh'

echo "Starting Pigeon installation, please type your PI password when prompted" &&
echo "Updating..." &&
# sudo apt-get update &&
# sudo apt-get dist-upgrade &&
echo "Installing Motion detection software" &&
# wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_jessie_motion_4.0.1-1_armhf.deb &&
# sudo apt-get install gdebi-core &&
# sudo gdebi pi_jessie_motion_4.0.1-1_armhf.deb &&
echo "Motion installation completed" &&
sudo chmod +x pigeon_modules_init.sh &&
sudo ./pigeon_modules_init.sh install &&
echo -n "Please define a name for this Pigeon camera (ex: backyard):"
read camera_name
sudo sed -i -e "/camera_name=/s/.*/camera_name='$camera_name'/" $MODULES &&
echo -n "Do you want to setup a password to access the live feed? [Y/n]:"
read password
if [[ $password == "y" ]] || [[ $password == "Y" ]] || [[ $password == "Yes" ]] || [[ $password == "yes" ]]
  then
    echo -n "Choose a login:"
    read login
    echo -n "Choose a password:"
    read passwd
    sudo sed -i -e "/stream_authentication/s/.*/stream_authentication $login:$passwd/" $CONF &&
    sudo sed -i -e "/stream_auth_method/s/.*/stream_auth_method 1/" $CONF
  fi
echo -n "Do you want to setup a different port (default is 8099) for the streaming server?[Y/n]"
read port
if [[ $port == "y" ]] || [[ $port == "Y" ]] || [[ $port == "Yes" ]] || [[ $port == "yes" ]]
  then
    echo -n "Choose a port (ex: 8033):"
    read finalport
    sudo sed -i -e "/stream_port/s/.*/stream_port $finalport/" $CONF
  else
  finalport=8099
  fi
sudo motion -c $CONF &&
echo "=========================="
echo "Installation completed and service started" &&
echo "You can add the following command to your 'rc.local' file to run on startup:" &&
echo 'motion -c /home/pi/pigeon/'$CONF
echo "-------------------------"
echo "You can now watch your live stream at:"
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | { read ip; echo http://$ip:$finalport; }
echo "Please report any issues to github.com/geraldoramos/pigeon" &&
echo "=========================" &&
exit 1
