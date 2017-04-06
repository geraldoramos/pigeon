#!/usr/bin/env bash
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

CONF_FINAL='pigeon.conf'
cp $CONF_FINAL 'conf_builder.conf'
CONF_BUILD='conf_builder.conf'
cp $CONF_FINAL 'conf_builder2.conf'
CONF_BUILD2='conf_builder2.conf'

echo "Starting Pigeon installation" &&
echo "Updating..." &&
sudo apt-get update &&
sudo apt-get dist-upgrade &&
echo "Installing Motion detection software" &&
wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_jessie_motion_4.0.1-1_armhf.deb &&
sudo apt-get install gdebi-core &&
sudo gdebi pi_jessie_motion_4.0.1-1_armhf.deb &&
echo "Installing Dropbox-Uploader" &&
sudo ./dropbox_uploader.sh &&
echo -n "Do you want to setup a password to access the live feed? Y/n:"
read password
if [ $password == "y" ] || [ $password == "Y" ] || [ $password == "Yes" ] || [ $password == "yes" ]
  then
    echo -n "Choose a login:"
    read login
    echo -n "Choose a password:"
    read passwd
    sed "/stream_authentication/s/.*/stream_authentication $login:$passwd/" $CONF_BUILD > $CONF_BUILD2 &&
    sed "/stream_auth_method/s/.*/stream_auth_method 1/" $CONF_BUILD2 > $CONF_FINAL &&
    rm -rf $CONF_BUILD
    rm -rf $CONF_BUILD2
  fi
sudo motion -c $CONF_FINAL &&
echo "=========================="
echo "Installation completed and service started" &&
echo "You can add the following command to your 'rc.local' file to run on startup:" &&
echo 'motion -c /home/pi/pigeon/'$CONF_FINAL
echo "-------------------------"
echo "You can now watch your live stream at:"
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' | { read ip; echo http://$ip:8099; }
echo "Please report any issues to github.com/geraldoramos/pigeon" &&
echo "=========================" &&
rm -rf $CONF_BUILD
rm -rf $CONF_BUILD2
exit 1
