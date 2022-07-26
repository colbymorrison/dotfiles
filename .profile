export EDITOR=nvim
export VISUAL=$EDITOR
export CLICOLOR=1

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export YADM_ALT=$XDG_CONFIG_HOME/yadm/alt

YADM_CLASS=$(yadm config local.class)
if [[ $OSTYPE == "linux-gnu" ]]; then
    export DISTRO=$(cat /etc/os-release | head -n1 | grep NAME= | sed s/NAME=// | sed s/\"//g)
    export PATH="$PATH:$HOME/bin"
    export TMUX_TERM=tmux-256color

    if [[ $YADM_CLASS == "linux-gui" ]] ; then
        export TERM=alacritty
        export PATH="$PATH:$HOME/.local/bin:/snap/bin"
        export QT_STYLE_OVERRIDE=adwaita
        export FZF_DEFAULT_COMMAND='fd -H -t f -t d -t l'
	export FZF_DEFAULT_OPTS='--preview="~/scripts/preview.sh {}" --preview-window hidden --bind ctrl-space:toggle-preview --height 60%'
        export DEFAULT_TMUX_SESSION='home'
        export PRIMARY_MONITOR='eDP-1'
        export SECONDARY_MONITOR='HDMI-2'
        export CM_LAUNCHER=rofi
        export CM_SELECTIONS=clipboard
        export CPY_PRG="xclip -i -sel clipboard"
    fi

    if [[ $YADM_CLASS == "linux-server" ]]; then
        export TERM=xterm-256color
        # export FZF_DEFAULT_COMMAND='fd -t f -t d -t l'
        export CPY_PRG="nc -N localhost 8377"
    fi
fi

if [[ $OSTYPE == "darwin"* ]]; then
    export BASH_SILENCE_DEPRECATION_WARNING=1
    export CPY_PRG="pbcopy"
    export PATH="$PATH:$HOME/bin"
    export TERM=alacritty
    export TMUX_TERM=$TERM

    if sysctl -a | grep brand | grep M1 > /dev/null 2>&1; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi;
