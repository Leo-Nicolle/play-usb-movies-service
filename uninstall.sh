#!/bin/bash
sudo systemctl stop play-usb.service
sudo systemctl disable play-usb.service
sudo rm "/lib/systemd/system/play-usb.service"
sudo rm "/etc/udev/rules.d/play-usb-movies.rules"
rm play-usb-movies.rules
rm play-usb.service
sudo udevadm control --reload