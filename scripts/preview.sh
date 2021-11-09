#! /bin/bash

## Default fzf preview command

## The vim fzf preview is a good default
FZF_VIM_PREVIEW="$HOME/.vim/plugged/fzf.vim/bin/preview.sh"
 
if [[ -f "$FZF_VIM_PREVIEW" ]]; then
    CAT_PRG="$FZF_VIM_PREVIEW" 
elif command -v bat > /dev/null; then
    CAT_PRG="bat"
else
    CAT_PRG="cat"
fi

[[ -d $1 ]] && tree -L 1 $1 || "$CAT_PRG" $1 
