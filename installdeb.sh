#!/bin/bash

dpkg --list listusb | grep "listusb"

if [ $? -eq 0 ]; then
  listusb
else
  dpkg -i *.deb
  listusb
fi
