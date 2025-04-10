#/usr/bin/env bash

pass show personal/toshiba-usb-bitlocker | sudo cryptsetup open /dev/sda1 secure -
sudo mount /dev/mapper/secure /home/eleloi/secure
