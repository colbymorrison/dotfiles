#! /bin/bash

FLE="$HOME/.dconf-settings.ini"
dconf dump / > "$FLE"

if yadm diff | grep "$FLE"; then
	yadm add "$FLE"
	yadm commit -C HEAD --amend
fi

