
#Define on_movie_end routine
echo "on_movie_end routine for Dropbox"
sudo sh './modules/dropbox/binaries/dropbox_uploader.sh upload %f /detections/ && rm -rf %f'
