#!/bin/bash

while getopts ":s:w:h:f:e:" opt; do
  case $opt in
    s) SECRET="$OPTARG"
    ;;
    w) W="$OPTARG"
    ;;
    h) H="$OPTARG"
    ;;
    f) RTMP="$OPTARG"
    ;;
    e) RASPI_EXTRA_ARGS="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

W=${W:-"1920"}
H=${H:-"1080"}
RTMP=${RTMP:-"rtmp://a.rtmp.youtube.com/live2/"}
RASPI_EXTRA_ARGS=${RASPI_EXTRA_ARGS:-""}

echo "=============="
echo "== SETTINGS =="
echo "=============="
echo "Live-stream KEY: $SECRET"
echo "Live-stream SERVER: $RTMP"
echo "Video: $W x $H"
echo "Extra Args: $RASPI_EXTRA_ARGS"
echo "=========="
echo "== LIVE =="
echo "=========="

raspivid -o - -t 0 -w $W -h $H -fps 24 -g 24 $RASPI_EXTRA_ARGS | ffmpeg -re -f lavfi -i anullsrc -f h264 -i pipe:0 -c:v copy -ar 44100 -ac 1 -acodec pcm_s16le -f s16le -strict experimental -f flv $RTMP$SECRET
