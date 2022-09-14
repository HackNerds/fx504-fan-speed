#!/bin/bash

# script for setting fan speed on asus laptops (FX504)
usage() {
  echo "Usage: $0 [performance|turbo|silent] or $0 [p|t|s]"
}

# set fan speed
if [ ! -z $1 ]; then
  if [ $1 = "p" ] || [ $1 = "performance" ]; then
    # to performance
    cd /sys/devices/platform/asus-nb-wmi
    sudo sh -c "echo 0 >> fan_boost_mode"
    cd - > /dev/null
  elif [ $1 = "t" ] || [ $1 = "turbo" ]; then
    # to turbo
    cd /sys/devices/platform/asus-nb-wmi
    sudo sh -c "echo 1 >> fan_boost_mode"
    cd - > /dev/null
  elif [ $1 = "s" ] || [ $1 = "silent" ]; then
    # to silent
    cd /sys/devices/platform/asus-nb-wmi
    sudo sh -c "echo 2 >> fan_boost_mode"
    cd - > /dev/null
  else
    usage
  fi
fi

# show current fan speed
export FAN=$(cat /sys/devices/platform/asus-nb-wmi/fan_boost_mode);
if [ $FAN -eq 0 ]
  then echo "Fan Mode: performance (balanced)"
elif [ $FAN -eq 1 ]
  then echo "Fan Mode: turbo (gaming)"
elif [ $FAN -eq 2 ]
  then echo "Fan Mode: silent (quiet)"
fi
