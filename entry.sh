#!/bin/bash

SECRET=$1
W=${2:-"1920"}
H=${3:-"1080"}
RTMP=${4:-"rtmp://a.rtmp.youtube.com/live2/"}
RASPI_EXTRA_ARGS=${5:-""}

echo Live-stream secret: $1

raspivid -o - -t 0 -w $W -h $H -fps 24 -g 24 $RASPI_EXTRA_ARGS | ffmpeg -re -f lavfi -i anullsrc -f h264 -i pipe:0 -c:v copy -ar 44100 -ac 1 -acodec pcm_s16le -f s16le -strict experimental -f flv $RTMP$1
