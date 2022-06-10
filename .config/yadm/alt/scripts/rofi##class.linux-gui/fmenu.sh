#!/bin/bash

# options to be displayed
option0="Contact Helpdesk"
option1="Feedback Group"
option2="Fix My Linux"
option3="My Devices"
option4="Gather system/chef logs for HD"
option5="Initialize LUKS Recovery Key"
option6="Renew Corpcanal Certs"
option7="Renew Lighthouse Cert"
option8="Renew Kerb Tickets"
option9="Open Scorecard Health"

# options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5\n$option6\n$option7\n$option8\n$option9"

chosen="$(echo -e "$options" | rofi -click-to-exit -lines 10 -dmenu -p "fmenu")"
case $chosen in
    $option0)
        xdg-open "https://fburl.com/help";;
    $option1)
        xdg-open "https://fb.workplace.com/groups/NoMAD.Feedback";;
    $option2)
        alacritty -e $SHELL -c 'test -f /usr/facebook/cpe/tags/.solo_enabled && sudo /opt/chef-solo/bin/soloctl --name=cpe_init -Hic || sudo /usr/local/bin/chefctl -ic -H; echo Press RETURN; read R; exit';;
    $option3)
        xdg-open "https://fburl.com/devices";;
    $option4)
        alacritty -e /opt/facebook/bin/bugnub_linux;;
    $option5)
        alacritty -e sudo /opt/facebook/bin/luksctl init;;
    $option6)
        alacritty -e /usr/local/bin/cc-certs;;
    $option7)
        alacritty -e /opt/facebook/bin/certctl_user_wrapper.py;;
    $option8)
        alacritty -e /opt/facebook/bin/kerbctl;;
    $option9)
        xdg-open "/opt/scorecard/log/scorecard.html";;
esac
