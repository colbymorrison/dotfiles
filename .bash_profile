# ~/.bash_profile
# Run for login shells (after /etc/profile)

[[ -f ~/.bashrc ]] && source ~/.bashrc

export EDITOR=nvim
export VISUAL=$EDITOR
export CLICOLOR=1

export IS_FB=$(echo $HOSTNAME | grep facebook.com > /dev/null; echo $?)

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export FZF_DEFAULT_OPTS='--preview="~/scripts/preview.sh {}" --preview-window hidden --bind ctrl-space:toggle-preview --height 60%'
export YADM_ALT=$XDG_CONFIG_HOME/yadm/alt

YADM_CLASS=$(yadm config local.class)
if [[ $OSTYPE == "linux-gnu" ]]; then
    export DISTRO=$(cat /etc/os-release | head -n1 | grep NAME= | sed s/NAME=// | sed s/\"//g)
    export PATH="$PATH:$HOME/bin"

    if [[ $YADM_CLASS == "linux-gui" ]] ; then
        export TERMINAL=alacritty
        export PATH="$PATH:$HOME/.local/bin:/snap/bin"
        export QT_STYLE_OVERRIDE=adwaita
        export FZF_DEFAULT_COMMAND='fd -H -t f -t d -t l'
        export DEFAULT_TMUX_SESSION='home'
        export PRIMARY_MONITOR='eDP-1'
        export SECONDARY_MONITOR='HDMI-2'
        export CM_LAUNCHER=rofi
        export CM_SELECTIONS=clipboard
        export CPY_PRG="xclip -i -sel clipboard"
    fi

    if [[ $YADM_CLASS == "work" ]]; then
        export TERM=xterm-256color
        export FZF_DEFAULT_COMMAND='fd -t f -t d -t l'
        export CPY_PRG="nc localhost 8377"
    fi
fi

if [[ $OSTYPE == "darwin"* ]]; then
    export TERMINAL=iTerm
    export BASH_SILENCE_DEPRECATION_WARNING=1
    export CPY_PRG="pbcopy"
fi;

