Quake 3 demo in Docker
======================

This Dockerfile allows you to run Quake 3 demo in an unprivileged container running in a standard Gnome desktop session.

Build
-----
Find the file linuxq3ademo-1.11-6.x86.gz.sh and copy it to this directory (see checksum file) then run:

`$ docker build . -t docker-q3demo`

Run
---
```
$ docker run \
    -d \
    --name q3demo \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v $XAUTHORITY:$XAUTHORITY \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=$XAUTHORITY \
    --device /dev/dri \
    --device /dev/dsp \
    docker-q3demo
```

Enable sound
------------
Run the following on the host:
```
$ modprobe snd-pcm-oss
$ echo "q3demo 0 0 direct" > /proc/asound/card0/pcm0p/oss
$ echo "q3demo 0 0 disable" > /proc/asound/card0/pcm0c/oss
```

Links
-----
- http://ordinary-linux-user.blogspot.com/2009/09/installing-quake-3-arena-demo-on-ubuntu.html
