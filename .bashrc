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
  export PS1="\[\033[0;93m\]\u@\h\[\033[01;34m\] \W \[\033[00m\][\D{%T}]\[\033[32m\]\$(_scm_prompt)\[\033[00m\]$ "
else
  export PS1="\[\033[0;93m\]\u@\h\[\033[01;34m\] \W \[\033[00m\][\D{%T}]\[\033[32m\]\$(~/scripts/parse_git_branch.sh)\[\033[00m\]$ "
fi

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
  if [[ -e $1  ]]; then
    [[ -f $1 ]] && $EDITOR $1 || cd $1
  fi
}

# Fzf all files and directories in current directory
opf() {
  open_if_exists $(fzf)
}

# Fzf all files
if [[ $IS_FB == 0 ]];then
    ops(){
      open_if_exists $(fd . -t f -t d -H -E 'fbsource' '/home/cmorrison' | fzf -m --preview="less {}")
    }
else
    ops(){
      open_if_exists $(fd . -t f -t d -H $HOME | fzf)
    }
fi

# Fzf all directories under ~
cdf() {
  cd "$(fd  . -t d $HOME | fzf)"
}

# Autoconnect to tmux
tmux_connect(){
  if [[ ! $TMUX && -t 0 && $TERM_PROGRAM != vscode ]]; then
    session_exists=$(tmux list-sessions -F '#{session_name}' 2>/dev/null | grep $DEFAULT_TMUX_SESSION  | head -1)
    if [[ $session_exists ]]; then
      tmux $TMUX_OPTIONS attach-session -t $DEFAULT_TMUX_SESSION
    else
      cd $DEFAULT_TMUX_DIR
      tmux $TMUX_OPTIONS new-session -s $DEFAULT_TMUX_SESSION
    fi
  fi
}

cpy(){
  $CPY_PRG
}

checkout_fzf() {
  [ "$#" -eq 1 ] && git checkout $1 || git checkout $(git branch | fzf --height="10")
}

if [[ $IS_FB == 0 ]]; then
  # Pastry previous command with command name as title
  p() {
    "$@" | pastry -t "$*"
  }

  # Jump to corresponding buck-out directory
  buckout() {
    local repopath="$(buck root)"
    pushd "$repopath/buck-out/gen/$(realpath . --relative-to="$repopath")"
  }
fi


# --Completion-- #
[[ -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

if [[ -d $HOME/.fzf/ ]]; then 
  . $HOME/scripts/fzf/completion.bash
  . $HOME/scripts/fzf/key-bindings.bash
fi

# --Auto Connect tmux-- #
tmux_connect

[[ -f $HOME/.cache/wal/sequences ]] && (cat ~/.cache/wal/sequences &)
