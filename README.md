<p align="center"><img src="https://s3-us-west-1.amazonaws.com/allge.us/logo_pigeon.svg" width="400"/></p>

# Pigeon
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://github.com/geraldoramos/pigeon/blob/master/LICENSE)
[![PayPal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.me/GeraldoRamos)
[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/fold_left.svg?style=social&label=Follow%20%40geraldoramos)](https://twitter.com/geraldoramos)

Pigeon is a simple cloud home surveillance camera project that uses the new Raspberry Pi Zero W single board computer ($10). It uses a custom designed 3D printed enclosure that fits the board and the camera. A wall mount is also included. The software should work with any Raspberry PI version, but the 3D design is made specifically for the PI Zero W platform.

The goal of this project is to provide an easy way to setup a basic (yet functional) hackable cloud camera at the lowest possible cost.

##
<p align="center"><img src="https://s3-us-west-1.amazonaws.com/allge.us/pigif.gif" width="600"/></p>


**Features**

* Motion detection
* Integrated with Dropbox for motion detected clips storage (MP4 format)
* Simple step-by-step installation wizard
* Live streaming in the desktop/mobile browser with remote access capabilities
* Authentication for live stream visualization
* 3D printed enclosure
* Ability to create several integrations using IFTTT (ex: If Pigeon's dropbox folder changes, send an e-mail, SMS, or slack message including the clip file link).
* Automatically deletes locally recorded clips after uploading to Dropbox
* Self-contained modular system for easily creating new modules

**Requirements**
* (optional) 3D Printed enclosure. STL files and instructions available on [ThingiVerse](http://www.thingiverse.com/thing:2230707).
* A Rasberry Pi Zero W running Raspbian and connected to the internet. The regular (no-wifi) Raspberry PI Zero also works, but will require a usb wifi doongle that will stay out of the designed enclosure: [Buy a Raspberry PI Zero W][829f44e8]
* A Raspberry Pi camera with cable: [Buy it][09e7e3d1]
* (optional) A long micro-usb power cable: [Buy it](https://www.aliexpress.com/item/1-2-3-5m-10ft-90-degree-Angle-Long-Micro-USB-Cable-20cm-Sync-data-Charging/32794612542.html?spm=2114.01010208.3.12.Xj3wx5&ws_ab_test=searchweb0_0,searchweb201602_4_10065_10130_10068_10136_10137_10138_10060_10062_10141_10056_10055_10054_10059_10099_129_10103_10102_10096_10148_10052_10053_10050_10107_10142_10051_10143_10084_10083_10119_10080_10082_10081_10110_10111_10112_10113_10114_10037_10032_10078_10079_10077_10073_10070_10123_10120_10124-10120,searchweb201603_6,afswitch_1_afChannel,ppcSwitch_7,single_sort_0_default&btsid=fc05fbd8-0d8a-47c8-b643-02df18983f6f&algo_expid=bb5c67b9-9680-48f5-8c33-d24c88072ce4-1&algo_pvid=bb5c67b9-9680-48f5-8c33-d24c88072ce4)

  [09e7e3d1]: https://www.aliexpress.com/item/New-Arrival-Raspberry-Pi-Zero-Camera-5MP-RPI-Zero-Camera-Module-Webcam-for-Raspberry-Pi-Zero/32785811007.html?spm=2114.01010208.3.12.clLgGm&ws_ab_test=searchweb0_0,searchweb201602_4_10065_10130_10068_10136_10137_10138_10060_10062_10141_10056_10055_10054_10059_10099_129_10103_10102_10096_10148_10147_10052_10053_10050_10107_10142_10051_10143_10084_10083_10119_10080_10082_10081_10110_10111_10112_10113_10114_10037_10032_10078_10079_10077_10073_10070_10123_10120_10124-10120,searchweb201603_6,afswitch_1_afChannel,ppcSwitch_7,single_sort_0_default&btsid=71405a16-56ea-4466-a92f-cae0d046ea2e&algo_expid=6607631f-0fea-4dff-8fec-95a907b45e65-1&algo_pvid=6607631f-0fea-4dff-8fec-95a907b45e65
  [2c44525c]: https://www.raspberrypi.org/blog/raspberry-pi-zero-w-joins-family/ "Info"
  [829f44e8]: https://www.raspberrypi.org/blog/raspberry-pi-zero-w-joins-family/ "Info"


## Getting started

Connect to your Raspberry PI using SSH or using a monitor. Make sure you have the Raspberry PI camera already working, You can test using the following command:

```bash
raspistill -o cam.jpg
```

If camera is not working, make sure it's activated in the setup (option 5):
```bash
sudo raspi-config
```

If you have problems, check: https://www.raspberrypi.org/documentation/configuration/camera.md

Now, clone this repository using git (recommended) in the root of your Raspberry PI home directory:

```bash
cd /home/pi
git clone https://github.com/geraldoramos/pigeon.git
cd pigeon
```

When ready, give execution permission to the setup script and run it:

```bash
 chmod +x pigeon_install.sh
 ./pigeon_install.sh
```

The installation should take about 10-15 minutes and inputs from you will be necessary towards the process (ex: Dropbox configuration)

## After Installation

After the installation is completed, you will be able to watch the camera live feed by accessing:

```
http://[PI-ADDRESS]:[8099]
```

If you want to setup remote access, make sure to setup port forwarding in your modem admin panel (port 8099 to your Raspberry IP.)

If everything went fine, you will start seeing MP4 clips being saved on your Dropbox folder when motion events are triggered.

If you want to start at boot, edit the rc.local file as following:
```Bash
sudo nano /etc/rc.local
```
Add the following command below the comment, but leave the line exit 0 at the end, then save the file and exit

```
motion -c /home/pi/pigeon/pigeon.conf
```

To finalize, make sure you are using the right timezone, so the camera clips date will make sense to you.

```
sudo raspi-config
Select: Internationalisation Options

```

## Issues

If you are getting the "Unable to open video device" grey screen, you can try:

Run `sudo modprobe bcm2835-v4l2 ` [More info](https://raspberrypi.stackexchange.com/questions/27737/unable-to-open-video-device-and-grey-screen)

**OR**

Install Motion again directly from the repository:

```wget https://github.com/Motion-Project/motion/releases/download/release-4.0.1/pi_jessie_motion_4.0.1-1_armhf.deb dpkg -i pi_jessie_motion_4.0.1-1_armhf.deb```



## Current stage

This project is early stage and I'm looking for contributors. You can edit the ```pigeon.conf``` file to change default configurations and make it more suitable for your needs.


## Movement detected by the first assembled Pigeon (a squirrel)
![Squirrer](https://s3-us-west-1.amazonaws.com/allge.us/squirrel.jpg)


## This project uses code from the following repositories:
* [Motion-Project](https://github.com/Motion-Project/motion)
* [Dropbox-Uploader](https://github.com/andreafabrizi/Dropbox-Uploader)


## License
Pigeon is distributed under the GNU GENERAL PUBLIC LICENSE (GPL) version 2 or later

Follow me on [Twitter](http://twitter.com/geraldoramos)

