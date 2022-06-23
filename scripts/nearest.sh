#! /bin/sh

# Go to nearest file $1

nearest() {
  if [ -f "$1" ]; then
    printf '%s\n' "${PWD%/}/$1"
  elif [[ "$PWD" =~ $HOME\/fbcode\d*$ ]] || [ "$PWD" = / ]; then
    false
  else
    (cd .. && nearest "$1")
  fi
}

(cd $(dirname "$1") && nearest $1)
