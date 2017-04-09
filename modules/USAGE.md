# Pigeon Module system

Each module should have a folder that includes the following scripts:

**install.sh**
Called during Pigeon installation

**on_movie_end.sh**
Called when a new motion recording video is finalized

**on_picture_save**
Called when a new motion picture is taken

It should also include a "binaries" folder, where any external bundled script should be stored.
