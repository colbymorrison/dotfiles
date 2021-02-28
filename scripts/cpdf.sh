#! /bin/bash

fn=$(ls -l ~/$1  | cut -d '>' -f 2)

echo "Removing ~/$1"
rm ~/$1

echo "Copying $fn to ~"
cp ~/$fn ~
