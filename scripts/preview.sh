#! /bin/bash

[[ -f $1 ]] && cat $1 || tree -L 1 $1
