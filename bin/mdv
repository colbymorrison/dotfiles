#! /bin/bash

# View markdown

full_path=$(realpath $1)
html_path=$(echo $full_path | sed s/md/html/g)

markdown $full_path > $html_path

firefox $html_path
