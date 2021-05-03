#! /bin/sh

tmux copy-mode 
tmux send  -X search-backward "$ "
tmux send -X copy-end-of-line
