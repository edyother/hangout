#!/bin/bash

# Youtube URL
echo "Enter URL"
read URL

# Readable Filename
echo "New File Name -- No Spaces - No Suffix"
read A

mkdir $A
cd $A

# Video File name
V=$(youtube-dl --get-filename $URL)

# Download video
youtube-dl $URL

# Copy audio to new file
avconv -i "$V" $A.flac
echo "#########################"
echo "## Video to Audio Done ##"
echo "#########################"

# Convert audio from stereo to mono
sox -V3 $A.flac -c 1 $A.mono.flac
echo "#########################"
echo "## Stereo to Mono Done ##"
echo "#########################"

# Highpass filter at 80hz
sox -V3 $A.mono.flac $A.mono.hp.flac highpass 80
echo "###################"
echo "## Highpass Done ##"
echo "###################"

# Dynamic Range Compression
sox -V3 $A.mono.hp.flac $A.mono.hp.comp.flac compand 0.3,1.5 6:-60,-45,-15 -7 -90 0.3
echo "######################"
echo "## Compression Done ##"
echo "######################"

# Normalize to -1db
sox -V3 $A.mono.hp.comp.flac $A.mono.hp.comp.norm.flac gain -n -1
echo "########################"
echo "## Normalization Done ##"
echo "########################"

# Convert audio to mp3 format
flac -cd $A.mono.hp.comp.norm.flac |lame --verbose -b 96 - $A.mp3
echo "#########################"
echo "## mp3 Conversion Done ##"
echo "#########################"

# Make new video with the improved audio
avconv -i "$V" -i $A.mp3 -c:v copy -c:a copy -map 0:v -map 1:a $A.mp4
echo "####################"
echo "## New Video Done ##"
echo "####################"

cd ../
