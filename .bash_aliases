## Common Commands ## 
alias c='clear'
alias d='et -r 8377:8377 dev:8080'
alias e='exit'
alias g='grep'
alias l='ls -lah'
alias m='man'
alias r='ranger'
alias v='nvim'
alias ls='ls -A --color=auto'
alias df='df -h'
alias du='du -h'
alias ka='killall'
alias sbh='. ~/.bashrc'
alias fbc='cd ~/fbcode'
alias pbc='nc localhost 8377'
alias yada='cd ~/.config/yadm/alt'
alias tree='tree -a'
alias free='free -h'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules}'
alias pag='ps aux | grep'
alias open='xdg-open'
alias qemuvm='qemu-system-x86_64 -enable-kvm -vga std -m 2048 -cpu host -smp 4 -net nic,model=virtio -net user,hostfwd=tcp::2222-:22'
alias python='python3'

## config files ##
alias not="$EDITOR ~/Documents/notes.md"
alias evi="$EDITOR ~/.vimrc"
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
alias ga='git commit --amend'
alias ya='yadm commit --amend'
alias gau='git add -u'
alias yau='yadm add -u'
alias gaa='git add --all'
alias gb='git branch'
alias gbD='git branch -D'
alias gcmsg='git commit -m'
alias ycmsg='yadm commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias yst="yadm status"
alias ggrep='git grep'

## Hg ##
alias hgst='hg status'
alias hgd='hg diff'
alias hgds='hg diff --since-last-submit'
alias hgrv='hg revert'
alias hgrva='hg revert --all'
alias hgc='hg commit'
alias hga='hg amend'
alias ssl='hg ssl'
alias sl='hg sl'
alias hgsh='hg show'
alias hgco='hg checkout'
alias hgcw='hg checkout remote/fbcode/warm'
alias hgme='hg metaedit'

if [[ $OS == "Linux" ]] ; then
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

if [[ $IS_FB == 0 ]]; then
    ## Jellyfish ###
    alias jfs='jf submit'
    alias jfd='jf submit --draft'

    ### Arc ###
    alias arcp='arc pull'
    alias arcl='arc lint'
    alias arcf='arc fix'

    #### Fb tools ###
    alias hs='hostselect'
    alias sm='smcc'
    alias smt='smcc tree'
fi

