## Common Commands ## 
alias c='clear'
alias d='ssh dev'
alias e='exit'
alias g='grep'
alias l='ls -lah'
alias m='man'
alias r='ranger'
alias vi='nvim'
alias vim='nvim'
# alias ls='ls -A --color=auto'
alias df='df -h'
alias du='du -h'
alias ka='killall'
alias sbh='. ~/.bashrc'
alias yada='cd ~/.config/yadm/alt'
alias tree='tree -a'
alias free='free -h'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules}'
alias pag='ps aux | grep -v grep | grep'
alias qemuvm='qemu-system-x86_64 -enable-kvm -vga std -m 2048 -cpu host -smp 4 -net nic,model=virtio -net user,hostfwd=tcp::2222-:22'
alias python='python3'
alias cpl="history | tail -2 | head -1 | cut -f 5 -d ' ' | tr -d '\n' |  $CPY_PRG"
alias pip='pip3'

## config files ##
alias not="$EDITOR ~/Documents/notes.md"
alias evi="$EDITOR ~/.vimrc"
alias envi="$EDITOR ~/.config/nvim/lua/config.lua"
alias ebh="$EDITOR ~/.bashrc"
alias ebp="$EDITOR ~/.bash_profile"
alias etm="$EDITOR ~/.tmux.conf"
alias eba="$EDITOR ~/.bash_aliases"

## Directories ## 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

## Tmux ##
alias tmat='tmux a -t'
alias tmls='tmux ls'

## systemctl ##
alias stl='systemctl'
alias jnl='journalctl'

## Network Manager ##
alias wils='nmcli d wifi list'
alias wicon='nmcli d wifi connect'

## Git ##
alias ga='git add'
alias gau='git add -u'
alias gaa='git add --all'
alias gam='git commit -C HEAD --amend'
alias gb='git branch'
alias gbd='git branch -D'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias ggrep='git grep'
alias glg='git log --all --decorate --oneline --graph -10'
alias gp='git push'
alias gpu='git push --set-upstream origin $(git branch --show-current)'
alias gl='git pull'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gst='git status'
alias gsw='git show --ext-diff'
alias ya='yadm commit --amend'
alias yd='yadm diff'
alias yau='yadm add -u'
alias ycmsg='yadm commit -m'
alias yst="yadm status"

## Hg ##
# also see ~/.hgrc for more hg aliases
alias hgst='hg status'
alias hgd='hg diff'
alias hgds='hg diff --since-last-submit'
alias hgrv='hg revert'
alias hgrva='hg revert --all'
alias hga='hg amend'
alias ssl='hg ssl'
alias sl='hg sl'
alias hgsh='hg show'
alias hgco='hg checkout'
alias hgcw='hg checkout remote/fbcode/warm'
alias hgcm='hg checkout remote/master'
alias hgme='hg metaedit'
alias hgrc='hg rebase --continue'
alias hgp='hg prev'
alias hgn='hg next'
alias hgc='hg commit'
# files changed by this commit
alias hgsc='hg status --no-status --rev .^'

if [[ $OSTYPE == "linux-gnu" ]] ; then
    alias open="xdg-open"
    # ~/.config files #
    alias ebsp="$EDITOR ~/.config/bspwm/bspwmrc"
    alias esxh="$EDITOR ~/.config/sxhkd/sxhkdrc"
    alias epb="$EDITOR '+set syntax=dosini' ~/.config/polybar/config"
    alias exr="$EDITOR ~/.Xresources"

    # Zathura #
    alias zth='zathura'
    alias ztf='zathura --fork'

    alias polyrs='~/.config/polybar/launch.sh 2>&1 > /dev/null'
    alias chrome='/opt/google/chrome'

    if [[ $DISTRO == "Arch Linux" ]]; then
        # Pacman #
        alias pmin='yay -S'
        alias pmup='yay -Syu'
        alias pmrm='sudo pacman -Rns'
        alias spm='sudo pacman'
    fi
fi

if [[ $OSTYPE == "darwin"* ]] ; then
    alias brewin='brew install'
    alias brewup='brew upgrade'
    alias brewrm='brew remove'
    alias esxh="$EDITOR ~/.config/skhd/skhdrc"
fi
