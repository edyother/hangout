#!/bin/bash


#      $0        $1           $2         $3
# scriptname [songname] [start time] [end time]

# ffmpeg -ss 00:05:57 -t 00:03:00 -i "$I" -acodec copy -vcodec copy 02-hope-above.flv

echo ffmpeg -ss $2 -t $(echo $3-$2 | bc -l) -i '$I' -acodec copy -vcodec copy $1.flv >> cutscript.txt
echo "" >> cutscript.txt
