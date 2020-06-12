#!/bin/bash

FILE=listusb_all.deb
if test -f "$FILE"; then
    echo "$FILE exists."
else
    echo "$FILE must be copied to this directory"
    echo "Please, execute steps indicated in https://github.com/txicos/other-debian/blob/master/README.md"
    exit
fi


echo "Will try to create docker container based on Ubuntu 18.04"

docker image ls | awk '$1~/ubuntu/&&$2~/18.04/ {print "yes"}' | grep 'yes'

if [ $? -eq 0 ]; then
    echo OK

    docker container ls -a | grep "lsusb"

    if [ $? -eq 0 ]; then
      echo CONTAINER EXISTS
      echo "Running existing container"
      docker run lsusb

    else
      echo "Build and run docker"
      docker build --build-arg debfile=$FILE -t lsusb .
      docker run lsusb
    fi
else
    echo FAIL
    echo "Check if docker is installed or download Ubuntu 18.04 image"
    echo "docker pull ubuntu:18.04"
fi
