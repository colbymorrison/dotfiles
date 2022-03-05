#! /bin/sh

# Navigates to last command prompt

tmux copy-mode 
# TODO integrate with PS1 somehow
tmux send -X search-backward "@$(hostname -s)"
tmux send -X search-again
