# Live Youtube Streaming with the Raspberry Pi Zero W

## Install Docker

- curl -sSL https://get.docker.com | sh
- sudo usermod pi -aG docker
- reboot 

## Setup the Docker environment.

- ```clone this repo```
- cd folder-to-clone
- docker build -t pi-youtube-live/streaming . # Can take a while 
- docker run --rm --privileged --name cam pi-youtube-live/streaming:latest your-youtube-private-streaming-key 1080 720

## Usage

```
docker run --rm --privileged --name cam alexellis2/streaming:latest -s YOUTUBE-SECRET-KEY -w 1080 -h 720 -f "rtmp://a.rtmp.youtube.com/live2/" -e "-ex verylong -awb sun -rot 270"
```

## Parameters

```
-s YOUTUBE SECRET KEY 
-w VIDEO WIDTH
-h VIDEO HEIGH
-f RTMP URL SERVER
-e EXTRA ARGS TO THE RASPIVID COMMANDS 
```
