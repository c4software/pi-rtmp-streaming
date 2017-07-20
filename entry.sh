#!/bin/bash

while getopts ":a:p:" opt; do
  case $opt in
    s) SECRET="$OPTARG"
    ;;
    w) W="$OPTARG"
    ;;
    h) H="$OPTARG"
    ;;
    rtmp) RTMP="$OPTARG"
    ;;
    raspi_extra_args) RASPI_EXTRA_ARGS="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

SECRET=$1
W=${W:-"1920"}
H=${H:-"1080"}
RTMP=${RTMP:-"rtmp://a.rtmp.youtube.com/live2/"}
RASPI_EXTRA_ARGS=${RASPI_EXTRA_ARGS:-""}

echo Live-stream secret: $1

raspivid -o - -t 0 -w $W -h $H -fps 24 -g 24 $RASPI_EXTRA_ARGS | ffmpeg -re -f lavfi -i anullsrc -f h264 -i pipe:0 -c:v copy -ar 44100 -ac 1 -acodec pcm_s16le -f s16le -strict experimental -f flv $RTMP$1
