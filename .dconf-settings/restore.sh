#! /bin/bash

# Usage ./restore.sh [--yadm-check]
# If --yadm-check, only load files that changed in the last yadm commit 


command -v dconf >/dev/null 2>&1 && exit 0

cd "$HOME/.dconf-settings"
n=0
while read -r p; do
	FLE="$n.ini"

	if [[ $1 == "--yadm-check" ]]; then
		yadm show --pretty=format:%b --name-only | grep "$FLE" && dconf load "$p" < "$FLE"
	else
		dconf load "$p" < "$FLE"
	fi

	n=$((n+1))
done < paths
