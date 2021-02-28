#! /bin/bash

# Gets current git branch
# Used in bashrc and vimrc

branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')

if [[ ! -z $branch ]]; then
    echo "$branch "
fi

