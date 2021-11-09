# .bashrc

# Run by interactive shells (after /etc/bash.bashrc)

# only source in interactive shell
[[ $- != *i* ]] && return

if [[ $IS_FB == 0 ]]; then
  # Load CentOS stuff and Facebook stuff (don't remove these lines).
  source /etc/bashrc
  source /usr/facebook/ops/rc/master.bashrc
fi

# ---Env vars--- #
if [[ $IS_FB == 0 ]]; then
  source $LOCAL_ADMIN_SCRIPTS/scm-prompt
  VCS="\$(_scm_prompt)"
elif [ -f ~/scripts/parse_git_branch.sh ]; then
  VCS="\$(~/scripts/parse_git_branch.sh)"
else
  VCS=""
fi

export PS1="\[\033[0;93m\]\u@\h\[\033[01;34m\] \W \[\033[00m\][\D{%T}]\[\033[32m\] $VCS\[\033[00m\]$ " 

# ---Alias--- #
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# --History--#
HISTFILESIZE=-1
HISTSIZE=1000000
HISTCONTROL=ignoredups
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # share history between open terminals

# ---Functions--- #

mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Run prev command w/ different options
difo(){
  last_command=$(history | tail -2 | head -1 | cut -d ' ' -f 5)
  $last_command $1
}

open_if_exists(){
  if [[ -e $1 ]]; then
    [[ -f $1 ]] && $EDITOR $1 || pushd $1
  fi
}

cpy(){
  $CPY_PRG
}

checkout_fzf() {
  [ "$#" -eq 1 ] && git checkout $1 || git checkout $(git branch | fzf --height="10")
}

if [[ $IS_FB == 0 ]]; then
  source /usr/local/share/fb_tools/fb.shell

  # Pastry previous command with command name as title
  p() {
    "$@" | pastry -t "$*"
  }

  # Jump to corresponding buck-out directory
  buckout() {
    local repopath="$(buck root)"
    pushd "$repopath/buck-out/gen/$(realpath . --relative-to="$repopath")"
  }

  twt() {
    hostselect -F twtasks $1 | $CPY_PRG
  }
fi


# --Completion-- #
[[ -f /usr/share/bash-completion/bash_completion ]] && \
  source /usr/share/bash-completion/bash_completion

if [[ -d /usr/share/fzf/shell ]]; then
    source /usr/share/fzf/shell/key-bindings.bash
    HAS_FZF_COMPLETION=1
elif [[ -d $HOME/.fzf/ ]]; then 
    source $HOME/scripts/fzf/key-bindings.bash
    HAS_FZF_COMPLETION=1
fi

if [[ "$HAS_FZF_COMPLETION" ]]; then
    # Override fzf completions
    # Alt+T : Open or cd files in current dir
    # Ctrl+T: Open or cd all files under ~
    bind -x '"\et": open_if_exists $(__fzf_select__)'
    if [[ $IS_FB == 0 ]]; then
        bind -x '"\C-t": open_if_exists $(fd . -t f -t d -t l -H -E "fbsource*" -E"configerator*" $HOME | fzf)'
    else
        bind -x '"\C-t": open_if_exists $(fd -H -t f -t d -t l . $HOME | fzf | sed s+~+/home/cmorrison+g)'
    fi
fi


[[ -f $HOME/.cache/wal/sequences ]] && (cat ~/.cache/wal/sequences &)

