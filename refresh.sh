#!/bin/bash
# set -x

# watch -n 10 bash getgdraw.sh

name=$1
inbox=$2
size=$3
url=$4

now=$(date +"%Y%m%d_%H%M%S")
mkdir -vp $inbox$name

wget -O $inbox$name/$now.png "$url/pub?w=$size&h=$size"
rm `duff -re $inbox$name/`

# HD VERSION
# convert -resize $size -alpha remove \
#         -loop 0  -delay 1x3\
#         -colors 8 -dither FloydSteinberg \
#         "$inbox$name/*.png" $inbox$name/animated.gif

# gifsicle -O $inbox$name/animated.gif > $inbox$name/$name-opt.gif

# rm $inbox$name/animated.gif

# SD VERSION
convert -resize 250 -alpha remove \
        -loop 0  -delay 1x3\
        -colors 8 -dither FloydSteinberg \
        "$inbox$name/*.png" $inbox$name/animated.gif

gifsicle -O $inbox$name/animated.gif > $inbox$name/$name-opt.gif

rm $inbox$name/animated.gif
