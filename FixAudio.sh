#!/bin/bash

# Video File name
V="Traditional Music Hangout on Air 2.mp4"
# Audio file name NO SUFFIX
A="TradHang2"

avconv -i "$V" $A.flac
echo "#########################"
echo "## Video to Audio Done ##"
echo "#########################"

sox -V3 $A.flac -c 1 $A.mono.flac
echo "#########################"
echo "## Stereo to Mono Done ##"
echo "#########################"

sox -V3 $A.mono.flac $A.mono.hp.flac highpass 80
echo "###################"
echo "## Highpass Done ##"
echo "###################"

sox -V3 $A.mono.hp.flac $A.mono.hp.comp.flac compand 0.3,1.5 6:-60,-45,-15 -7 -90 0.3
echo "######################"
echo "## Compression Done ##"
echo "######################"

sox -V3 $A.mono.hp.comp.flac $A.mono.hp.comp.norm.flac gain -n -1
echo "########################"
echo "## Normalization Done ##"
echo "########################"

flac -cd $A.mono.hp.comp.norm.flac |lame --verbose -b 96 - $A.mp3
echo "#########################"
echo "## mp3 Conversion Done ##"
echo "#########################"

avconv -i "$V" -i $A.mp3 -c:v copy -c:a copy -map 0:v -map 1:a $A.mp4
echo "####################"
echo "## New Video Done ##"
echo "####################"
