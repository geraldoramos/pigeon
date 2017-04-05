<p align="center"><img src="https://s3-us-west-1.amazonaws.com/allge.us/logo_pigeon.svg" width="600"/></p>

# Pigeon

Pigeon is a simple cloud home surveillance camera project based on the new Raspberry Pi Zero W platform. It uses a custom designed 3D printed enclosure and wall mount.

The goal of this project is to provide an easy way to setup a basic (yet functional) cloud camera at a very low cost (~$20)

**Features**

* Motion detection
* Integrated with Dropbox for motion detected clips storage (MP4 format)
* Simple step-by-step configuration wizard
* Live streaming in the desktop/mobile browser with remote access capabilities
* Authentication for live stream visualization
* 3D printed enclosure
* Ability to create several integrations using IFTTT (ex: If Pigeon's dropbox folder changes, send an e-mail, SMS, or slack message including the clip file link).
* Automatically delete local recorded clips after upload to Dropbox

**Requirements**
* (optional) 3D Printed enclosure. STL files and instructions available on [ThingVerse](http://www.thingiverse.com/thing:2210410).
* A Rasberry Pi Zero W running Raspbian and connected to the internet: [Buy it][829f44e8]
* A Raspberry Pi camera: [Buy generic version][09e7e3d1] or [Buy official version][09e7e3d1]
* (optional) A long micro-usb power cable: [Buy it](https://www.aliexpress.com/item/1-2-3-5m-10ft-90-degree-Angle-Long-Micro-USB-Cable-20cm-Sync-data-Charging/32794612542.html?spm=2114.01010208.3.12.Xj3wx5&ws_ab_test=searchweb0_0,searchweb201602_4_10065_10130_10068_10136_10137_10138_10060_10062_10141_10056_10055_10054_10059_10099_129_10103_10102_10096_10148_10052_10053_10050_10107_10142_10051_10143_10084_10083_10119_10080_10082_10081_10110_10111_10112_10113_10114_10037_10032_10078_10079_10077_10073_10070_10123_10120_10124-10120,searchweb201603_6,afswitch_1_afChannel,ppcSwitch_7,single_sort_0_default&btsid=fc05fbd8-0d8a-47c8-b643-02df18983f6f&algo_expid=bb5c67b9-9680-48f5-8c33-d24c88072ce4-1&algo_pvid=bb5c67b9-9680-48f5-8c33-d24c88072ce4)

  [09e7e3d1]: https://www.aliexpress.com/item/Free-Shipping-raspberry-pi-camera-5mp-pixels-RASPBERRY-PI-CAMERA/32293433078.html?spm=2114.01010208.3.10.7MsMYW&ws_ab_test=searchweb0_0,searchweb201602_4_10065_10130_10068_10136_10137_10138_10060_10062_10141_10056_10055_10054_10059_10099_129_10103_10102_10096_10148_10052_10053_10050_10107_10142_10051_10143_10084_10083_10119_10080_10082_10081_10110_10111_10112_10113_10114_10037_10032_10078_10079_10077_10073_10070_10123_10120_10124-10120,searchweb201603_6,afswitch_1_afChannel,ppcSwitch_7,single_sort_0_default&btsid=6fcd558a-a68d-4928-9752-ecbf6c072dbf&algo_expid=abee82ff-a7cd-4fec-b99a-e7dbf11d9f41-4&algo_pvid=abee82ff-a7cd-4fec-b99a-e7dbf11d9f41 "Generic version"
  [2c44525c]: https://www.raspberrypi.org/blog/raspberry-pi-zero-w-joins-family/ "Info"
  [829f44e8]: https://www.raspberrypi.org/blog/raspberry-pi-zero-w-joins-family/ "Info"
  [09e7e3d1]:https://www.aliexpress.com/item/Free-Shipping-raspberry-pi-camera-5mp-pixels-RASPBERRY-PI-CAMERA/32293433078.html?spm=2114.01010208.3.10.7MsMYW&ws_ab_test=searchweb0_0,searchweb201602_4_10065_10130_10068_10136_10137_10138_10060_10062_10141_10056_10055_10054_10059_10099_129_10103_10102_10096_10148_10052_10053_10050_10107_10142_10051_10143_10084_10083_10119_10080_10082_10081_10110_10111_10112_10113_10114_10037_10032_10078_10079_10077_10073_10070_10123_10120_10124-10120,searchweb201603_6,afswitch_1_afChannel,ppcSwitch_7,single_sort_0_default&btsid=6fcd558a-a68d-4928-9752-ecbf6c072dbf&algo_expid=abee82ff-a7cd-4fec-b99a-e7dbf11d9f41-4&algo_pvid=abee82ff-a7cd-4fec-b99a-e7dbf11d9f41 "Generic version"


## Getting started

Make sure you have the raspberry PI camera already working, You can try:

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
git clone https://github.com/geraldoramos/pigeon.git
cd pigeon
```

During the installation process, you will need to create a Dropbox app and get an access token. If you want to have that before starting the installation, go to:
https://www.dropbox.com/developers/apps/create

When ready, give execution permission to the setup script and run it:

```bash
 chmod +x pigeon_install.sh
 ./pigeon_install.sh
```

You'll be guided through a wizard in order to install and configure required software

## After Installation

After the installation is completed, you will be able to access the camera live feed by accessing:

```
http://[PI-ADDRESS]:[PORT]
```

If you want to setup remote access, make sure to port-forward the defined port in your modem admin panel.

If everything went fine, you will start seeing MP4 clips being saved on your Dropbox folder when motion events are triggered.

If you want to start at boot, edit the rc.local file as following:
```Bash
sudo nano /etc/rc.local
```
Add the following command below the comment, but leave the line exit 0 at the end, then save the file and exit

```
motion -c /home/pi/pigeon/motion.conf &
```

To finalize, make sure you are using the right timezone, so the camera clips date will make sense to you.

```
sudo raspi-config
Select: Internationalisation Options

```

## Customizations

Feel free to edit the ```pigeon.conf``` file to change default configurations.

** Some future iterations ideas: **

Software:
* Create a web interface for management
* Integrate remote access (proxy)

Hardware:
* Include LED's that turns on when motion is detected
* Incorporate a servo in the design to pan or tilt the camera remotely


## This project uses code from the following repositories:
* [Motion-Project](https://github.com/Motion-Project/motion)
* [Dropbox-Uploader](https://github.com/andreafabrizi/Dropbox-Uploader)

## License
Pigeon is distributed under the GNU GENERAL PUBLIC LICENSE (GPL) version 2 or later.

## Donations

 If you want to support this project, please consider donating:
 * PayPal: https://paypal.me/GeraldoRamos
