#!/bin/bash

# This helps me build a script for editing a video with ffmpeg.

#       $0        $1                $2                     $3
# ./cutprep.sh [songname] [start time in seconds] [end time in seconds]
# ./cutprep.sh Yarmouth 152.4 342.7

# "$I" will be defined in the resulting script as the video file that
# all of these clips will be cut from.

echo ffmpeg -ss $2 -t $(echo $3-$2 | bc -l) -i '$I' -acodec copy -vcodec copy $1.'${I##*.}' >> cutscript.txt
echo "" >> cutscript.txt
