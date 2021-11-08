#! /bin/bash

## Default fzf preview command

## The vim fzf preview is a good default
# FZF_VIM_PREVIEW="$HOME/.vim/plugged/fzf.vim/bin/preview.sh"
#  
# if [[ -f "$FZF_VIM_PREVIEW" ]]; then
#     CAT_PRG="$FZF_VIM_PREVIEW" 

if command -v bat > /dev/null; then
    CAT_PRG="bat --color=always"
else
    CAT_PRG="cat"
fi

file=$(echo $1 | sed s+~+/home/cmorrison+g)

[[ -f $file ]] && $CAT_PRG $1 || tree -L 1 $1
