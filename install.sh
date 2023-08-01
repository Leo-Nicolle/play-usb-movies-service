#!/bin/bash

path=$(pwd)
cat play-usb-movies.template | sed "s|PATH|$path|g" > play-usb-movies.rules
cat service.template | sed "s|PATH|$path|g" > play-usb.service
sudo ln -s  "$path/play-usb.service" /lib/systemd/system/
sudo ln -s "$path/play-usb-movies.rules" /etc/udev/rules.d/
sudo udevadm control --reload
sudo systemctl daemon-reload
sudo systemctl enable play-usb.service
sudo systemctl start play-usb.service