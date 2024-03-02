#!/bin/bash

pkill vlc
# Path to your MP3 directory
mp3_directory="/home/ezzobir/Music/output_audio"

# set audio 35
pamixer --set-volume 35

# Change to the MP3 directory
cd "$mp3_directory"

# Play all MP3 files in the background
cvlc *.mp3 &

