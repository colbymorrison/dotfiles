#! /bin/bash

if [[ "$#" -eq 0 ]]; then
    fd . $HOME
else
    file=$1
    echo $file > ~/RL
    type=$(xdg-mime query filetype $file)
    
    if [[ $type == 'text/plain' ]]; then
        alacritty -e vim $file &
    else
        xdg-open $file &
    fi
    killall rofi
fi
