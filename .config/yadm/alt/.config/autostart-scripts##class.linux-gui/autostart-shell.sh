# Remap CapsLock to Control
setxkbmap -layout us -option ctrl:nocaps

# Startup programs
numlockx &
xsetroot -cursor_name left_ptr
xmodmap /home/cmorrison/.Xmodmap > /dev/null 2>&1
unclutter &
srandrd ~/scripts/dispay-handler.sh # Forks to background by default 
