
#Define on_picture_save routine

echo "on_picture_save routine for Dropbox"
sudo ./modules/dropbox/binaries/dropbox_uploader.sh upload %f /detections/ && rm -rf %f
