# Dconf auto save and restore

./paths contains dconf paths to track (all paths can be seen with `dconf dump /`)

For the path on line i of ./paths, `dconf dump $path` is saved as $i.ini

./save.sh and ./restore.sh will save and load the paths, with the option to update yadm

`.config/yadm/hooks` contains post commit and post pull hooks to call `./save.sh` and `./restore.sh` respectivley. This way, any changes will be automatically picked up/applied by yadm.
