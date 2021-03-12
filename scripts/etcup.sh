#! /bin/bash

# Check 2 directories for files with same name, if they differ
# ask to move one to the other

DIR1=/home/colby/etckeeper
DIR2=/etc

for f in $(ls $DIR1); do
	etc_pth=$DIR2/$f
	if [[ -d $etc_pth ]]; then
		if ! $(diff $f $etc_pth > /dev/null); then
			echo "$f differs"
			diff $f $etc_pth
			echo "change? (y/n)"
			read N
			echo $N
			if [[ $N == 'y' ]]; then
				echo ok
				cp $f $etc_pth
			fi
		fi
	fi
done
