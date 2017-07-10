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

## Parameters

- Youtube Live Key. (Keep it secret !)
- 1080, The X resolution of the Webkam feed.
- 720, The Y resolution of the Webcam feed.

