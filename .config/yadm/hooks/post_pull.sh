#! /bin/bash

FLE="$HOME/.dconf-settings.ini"
yadm show --pretty=format:%b --name-only | grep "$FLE" && dconf load / < dconf-settings.ini
