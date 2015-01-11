Docker TVHeadend
================

This is a Docker container that contains [TVHeadend](https://tvheadend.org/)

It also will present the web interface to the user to scan and configure channels.


```
mkdir -p /opt/docker-tvheadend-config
```

Build with

```
docker build -t tvheadend .
```

run with

```
docker run -d -p 9981:9981 -v=/opt/docker-tvheadend-config:/home/hts --device=/dev/bus/usb/002/003 tvheadend
```

*WARNING* security is set to be non-existant on the web interface. Logging in requires no username or password.
