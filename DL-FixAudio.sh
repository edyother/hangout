#!/bin/bash

# ./DL-FixAudio.sh [ URL ] [ directory and new file name ]
# for example
# ./DL-FixAudio.sh youtube.com/sdfjihgho Episode5

# requires youtube-dl, ffmpeg, sox, flac, and lame

mkdir $2
cd $2

# Video File name
V=$(youtube-dl --get-filename $1)

# Download video
youtube-dl $1

# Copy audio to new file
ffmpeg -i "$V" $2.flac
echo "#########################"
echo "## Video to Audio Done ##"
echo "#########################"

# Convert audio from stereo to mono
sox -V3 $2.flac -c 1 $2.mono.flac
echo "#########################"
echo "## Stereo to Mono Done ##"
echo "#########################"

# Highpass filter at 80hz
sox -V3 $2.mono.flac $2.mono.hp.flac highpass 80
echo "###################"
echo "## Highpass Done ##"
echo "###################"

# Dynamic Range Compression
sox -V3 $2.mono.hp.flac $2.mono.hp.comp.flac compand 0.3,1.5 6:-60,-45,-15 -7 -90 0.3
echo "######################"
echo "## Compression Done ##"
echo "######################"

# Normalize to -1db
sox -V3 $2.mono.hp.comp.flac $2.mono.hp.comp.norm.flac gain -n -1
echo "########################"
echo "## Normalization Done ##"
echo "########################"

# Convert audio to mp3 format
flac -cd $2.mono.hp.comp.norm.flac | lame --verbose -b 96 - $2.mp3
echo "#########################"
echo "## mp3 Conversion Done ##"
echo "#########################"

# Make new video with the improved audio
ffmpeg -i "$V" -i $2.mp3 -vcodec copy -acodec copy -map 0:v -map 1:a $2.flv
echo "####################"
echo "## New Video Done ##"
echo "####################"


cd ../
