
#Define on_movie_end routine
echo "on_movie_end routine for Dropbox"
sudo ./modules/dropbox/binaries/dropbox_uploader.sh upload $1 /detections/ && rm -rf $1
