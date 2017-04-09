#!/usr/bin/env bash

# This will run module-specific routines
# Receives the type of argument to run (ex: install, on_movie_end or on_picture_save).

echo "Starting Modules script"

for d in modules/*/ ; do
  chmod +x $d$1'.sh'
  sudo './'$d$1'.sh' $2
done
