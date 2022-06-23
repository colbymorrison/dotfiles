# Dotfiles

My dotfiles! Managed with [yadm](https://yadm.io/). Yadm allows me to manage files on different types of systems much easier than using a bare git repo.

yadm tracks ~ as a git repo. Instead of tracking everything under ~, it only tracks
the files you tell it to.

Use `yadm list-files` to see tracked files.

Files not in ~/.config/yadm/alt are installed across all sytems in their location in this repo relative to ~. Files in ~/.config/yadm/alt are only installed on some systems and are configured according to the [yadm docs](https://yadm.io/docs/alternates#). 

## Install
Install [yadm](https://yadm.io/docs/install)

`yadm clone git@github.com:colbymorrison/dotfiles.git`
`yadm bootstrap`

