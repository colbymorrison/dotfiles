#! /bin/bash

# Usage no-sxhkd [window class] [keystrokes]

# Execute the keystrokes (in xdotool format) in $2 outside of sxhkd in window
# with class $1

## TODO all instances of window, sxhkd as sysctl service?

killall sxhkd 2>&1 > /dev/null 

for window in $(xdotool search --class $1); do
    echo $window
    xdotool windowactivate $window
    xdotool key "$2" 
done

nohup sxhkd & 2>&1 > /dev/null
