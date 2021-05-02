#! /bin/sh

# Navigates to last command prompt

tmux copy-mode 
# TODO integrate with PS1 somehow
tmux send -X search-backward "@$HOSTNAME"
tmux send -X search-again
