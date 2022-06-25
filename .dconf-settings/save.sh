#! /bin/bash

# Usage ./save.sh [--yadm-commit]
# If --yadm-commit, amend any modifications to the previous commit

cd "$HOME/.dconf-settings"
n=0
while read -r p; do
	FLE="$n.ini"

	dconf dump "$p" > "$FLE"

	if [[ $1 == "--yadm-commit" ]] && yadm diff | grep "$FLE"; then
		yadm add "$FLE"
		yadm commit -C HEAD --amend
	fi
	n=$((n+1))

done < paths
