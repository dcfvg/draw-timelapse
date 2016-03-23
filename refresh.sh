#!/bin/bash
# set -x

# watch -n 10 bash getgdraw.sh

title=$1
inbox=$2
size=$3
url=$4

now=$(date +"%Y%m%d_%H%M%S")
mkdir -vp $inbox$title

wget -O $inbox$title/$now.png "$url/pub?w=$size&h=$size"

if [ $(duff -re main/ | wc -l) -gt 0 ]
  then

    echo "no changes …"
    rm `duff -re $inbox$title/`

  else

  echo "updating gif animation …"
  convert -resize $size -alpha remove \
          -loop 0  -delay 1x3\
          -colors 8 -dither FloydSteinberg \
          "$inbox$title/*.png" $inbox$title/animated.gif

  gifsicle -O $inbox$title/animated.gif > $inbox$title/$title-opt.gif

  rm $inbox$title/animated.gif

fi
