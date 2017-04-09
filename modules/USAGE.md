# Pigeon Module system

Each module should have a folder that includes the following scripts:

* **install.sh**
Called during Pigeon installation

* **on_movie_end.sh**
Called when a new motion recording video is finalized. The full path to the movie file is available through variable $1.

* **on_picture_save**
Called when a new motion picture is taken. The full path to the picture file is available through variable $1.

It should also include a "binaries" folder, where any external bundled script should be stored.

More options will be available soon.
