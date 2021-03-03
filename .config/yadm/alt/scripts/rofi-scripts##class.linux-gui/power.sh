#! /bin/bash

# See man rofi-script
if [[ "$#" -eq 0 ]]; then
    LOG_OUT="\tLog Out"
    POWER_OFF="\tPower Off"
    REBOOT="\tReboot"
    SUSPEND="\tSuspend"
    HIBERNATE="\tHibernate"
    LOCK="\tLock Screen"
    echo "$POWER_OFF\n$REBOOT\n$LOG_OUT\n$SUSPEND\n$HIBERNATE\n$LOCK"
fi
else
    case $1 in
        *"Power Off")
            tmux-session save
            poweroff
            ;;
        *"Reboot")
            tmux-session save
            systemctl reboot
            ;;
        *"Log Out")
            bspc quit
            ;;
        *"Suspend")
            systemctl suspend 
            ;;
        *"Hibernate")
            systemctl hibernate
            ;;
        *"Lock Screen")
            xset s activate
            ;;
        *)
            ;;
    esac
fi
