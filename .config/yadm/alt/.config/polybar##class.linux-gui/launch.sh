#! /bin/bash

# Terminate already running bar instances
kill -6 $(pgrep polybar) > /dev/null 2>&1

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 3; done

# Temp file (it changes)
base=/sys/devices/platform/coretemp.0/hwmon
[[ -d $base/hwmon0 ]] && export HWMON="$base/hwmon0/temp1_input" || export HWMON="$base/hwmon1/temp1_input"

# Wal config file
source  ~/.cache/wal/polybar-colors.sh

# Start on all monitors with right font size
for m in $(polybar --list-monitors | cut -d":" -f1); do
    # Can change font size by monitor here
    FONT_SZ=20

    export NOTOT="NotoSans-Bold:size=$FONT_SZ;0"
    export DEJA="DejaVuSans-Bold:size=$FONT_SZ;1"
    export TERMST="Termsynu:size=$FONT_SZ:antialias=false;-2"
    export AWSM="FontAwesome:size=$(($FONT_SZ+2));0"
    export AWSB="FontAwesome:size=$(($FONT_SZ+2));0"
    export MATRT="MaterialIcons:size=$(($FONT_SZ+3));0"

    MONITOR=$m polybar --reload top & > /dev/null 2>&1
done

