
# This will run module-specific routines
# Receives the type of argument to run (ex: install, on_movie_end or on_picture_save)

echo "Starting Modules script"

for d in modules/*/ ; do
  sudo sh './'$d$1'.sh'
done
