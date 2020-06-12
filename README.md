# Docker test

This a simple test to build a docker container, type in bash ubuntu

`make_docker.sh`

It is assumed that docker is installed in the system, together with an image of ubuntu 18.04 . 

Local debian package *listusb_all.deb* should be located in the same directory as script above.

If you want to run manually, type commands below in bash

```shell
docker build --build-arg debfile='listusb_all.deb' -t lsusb .
docker run lsusb
```

