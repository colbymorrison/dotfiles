## Common Commands ## 
alias c='clear'
alias e='exit'
alias g='grep'
alias l='ls -lah'
alias m='man'
alias r='ranger'
alias v='nvim'
alias t='tree -a'
alias ls='ls -A --color=auto'
alias df='df -h'
alias du='du -h'
alias ka='killall'
alias sbh='. ~/.bashrc'
alias fbc='cd ~/fbcode'
alias pbc='nc localhost 8377'
alias free='free -h'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules}'
alias pag='ps aux | grep'
alias open='xdg-open'
alias qemuvm='qemu-system-x86_64 -enable-kvm -vga std -m 2048 -cpu host -smp 4 -net nic,model=virtio -net user,hostfwd=tcp::2222-:22'
alias python='python3'

## config files ##
alias not="nvim ~/Misc/notes.md"
alias evi="nvim ~/dotfiles/vim/.vimrc"
alias ebh="nvim ~/dotfiles/shell/.bashrc"
alias etm="nvim ~/.tmux.conf"
alias eba="nvim ~/dotfiles/shell/.bash_aliases"

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

## Jellyfish ###
alias jfs='jf submit'
alias jfd='jf submit --draft'

### Arc ###
alias arcp='arc pull'
alias arcl='arc lint'
alias arcf='arc fix'

#### Fb tools ###
alias hs='hostselect'

## Git ##
alias ga='git add'
alias gau='git add -u'
alias gaa='git add --all'
alias gb='git branch'
alias gbD='git branch -D'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias ggrep='git grep'

