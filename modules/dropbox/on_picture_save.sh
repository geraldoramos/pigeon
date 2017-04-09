
#Define on_picture_save routine

echo "on_picture_save routine for Dropbox"
sudo sh './modules/dropbox/binaries/dropbox_uploader.sh upload %f /detections/ && rm -rf %f'
