#!/bin/bash

# This helps me build a script for editing a video with ffmpeg.

#       $0        $1           $2         $3
# ./cutprep.sh [songname] [start time] [end time]

echo ffmpeg -ss $2 -t $(echo $3-$2 | bc -l) -i '$I' -acodec copy -vcodec copy $1.flv >> cutscript.txt
echo "" >> cutscript.txt
