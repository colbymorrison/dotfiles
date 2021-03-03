#! /bin/sh

# Go to nearest TARGETS file
tgt(){
  x=$(pwd)
  while [ "$x" != "/" ] ; do
    x=$(dirname "$x")
    find "$x" -maxdepth 1 -name TARGETS
  done
}
