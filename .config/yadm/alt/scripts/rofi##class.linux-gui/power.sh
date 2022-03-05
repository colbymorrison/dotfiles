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
            gnome-session-quit --power-off --no-prompt
            ;;
        *"Reboot")
            gnome-session-quit --reboot --no-prompt
            ;;
        *"Log Out")
            gnome-session-quit --logout --no-prompt
            ;;
        *"Suspend")
            systemctl suspend 
            ;;
        *"Hibernate")
            systemctl hibernate
            ;;
        *"Lock Screen")
            gnome-screensaver-command -l
            ;;
        *)
            ;;
    esac
fi
