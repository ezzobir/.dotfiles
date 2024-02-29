#!/bin/bash

# Input and output directories
input_dir="/home/ezzobir/Downloads/input_audio"
output_dir="/home/ezzobir/Downloads/output_audio"


# Convert M4A files
for file in "$input_dir"/*.m4a; do
    output_file="$output_dir"/"$(basename "${file%.m4a}")".mp3
    ffmpeg -i "$file" -acodec libmp3lame -aq 2 "$output_file"
done

# Convert Opus files
for file in "$input_dir"/*.opus; do
    output_file="$output_dir"/"$(basename "${file%.opus}")".mp3
    ffmpeg -i "$file" -acodec libmp3lame -aq 2 "$output_file"
done

echo "Conversion completed."
