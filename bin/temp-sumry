#! /bin/sh

base=/sys/devices/platform/coretemp.0/hwmon
[[ -d $base/hwmon0 ]] && HWPATH=$base/hwmon0 || HWPATH=$base/hwmon1


for i in {1..5}; do
    echo "Crit alarm $i: $(cat $HWPATH/temp${i}_crit_alarm)"
    echo

    echo "Input $i: $(cat $HWPATH/temp${i}_input)"
    echo

    echo "Label$i: $(cat $HWPATH/temp${i}_label)"
    echo

    echo "Max$i: $(cat $HWPATH/temp${i}_max)"
    echo

    echo "Crit$i: $(cat $HWPATH/temp${i}_crit)"
    echo
done

