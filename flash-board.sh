#!/usr/bin/env bash

dfu-programmer atmega32u4 erase --force &&
dfu-programmer atmega32u4 flash usb2usb-tmk-wip-layout.hex &&
dfu-programmer atmega32u4 reset
