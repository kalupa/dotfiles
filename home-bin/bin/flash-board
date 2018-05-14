#!/usr/bin/env bash

echo "dfu-programmer: waiting"
until dfu-programmer atmega32u4 get bootloader-version > /dev/null 2>&1; do \
  echo -n "."; \
  sleep 1; \
  done
echo

dfu-programmer atmega32u4 erase --force
dfu-programmer atmega32u4 flash "$1.hex"
dfu-programmer atmega32u4 reset
