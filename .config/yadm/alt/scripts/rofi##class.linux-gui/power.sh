#! /bin/bash

# See man rofi-script
if [[ "$#" -eq 0 ]]; then
    LOG_OUT="\tLog Out"
    POWER_OFF="\tPower Off"
    REBOOT="\tReboot"
    SUSPEND=" \tSuspend"
    HIBERNATE="\tHibernate"
    LOCK="\tLock Screen"
    printf "$POWER_OFF\n$REBOOT\n$LOG_OUT\n$SUSPEND\n$HIBERNATE\n$LOCK"
else
    case $1 in
        *"Power Off")
            poweroff
            ;;
        *"Reboot")
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
