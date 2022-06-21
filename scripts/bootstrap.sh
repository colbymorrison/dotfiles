#! /bin/bash

function cmd_exists(){
	command -v $1 >/dev/null 2>&1 
}

# -- Detect package manager --
FLE=~/.config/bootstrap/package-manager.json
MANAGER=""
for key in $(jq 'keys[]' $FLE); do
	MANAGER=$(echo "$key" | sed s/\"//g)
	cmd_exists $MANAGER && break; 
done

if [[ $MANAGER == "" ]]; then
	echo "Couldn't find the pacakage manager for this system. Please add it to $FLE"
	exit 1
fi

echo "Detected package manager as $MANAGER"

INSTALL_CMD="sudo $MANAGER $(jq .$MANAGER.install $FLE | sed s/\"//g)"
UPDATE_CMD="sudo $MANAGER $(jq .$MANAGER.update $FLE | sed s/\"//g)"

echo "Performing system update"
# $UPDATE_CMD

#
# Usage: install_if_missing [cmd] [pkg_name]
#
# Return:
# 	 0 -- was missing and successfully installed
#        1 -- was missing and failed to install
#        2 -- already installed
function install_if_missing() {
	PKG=1
	if [ -z {$2+x} ]; then
		PKG=$2
	fi


	if  ! cmd_exists $1; then
		echo "Installing $PKG"
		$INSTALL_CMD $PKG
		if ! cmd_exists $1; then
			echo "Failed to install $1"
			return 1
		fi
	else
		echo "$1 is already installed :)"
		return 2
	fi
}

# -- Bash --
install_if_missing bash

if [ ! -f "/bin/bash"]; then
	echo "Please install bash to /bin/bash then try again. See TODO"
	exit 1
fi

if ! echo $SHELL | grep "bash" > /dev/null 2>&1; then
	echo "Chaging shell to bash"
	chsh -s /bin/bash
fi

# -- Tmux --
echo
install_if_missing tmux

# -- Fzf --
echo
install_if_missing fzf

if [ $? -eq 1 ]; then
	echo "Please isntall fzf then try again. See https://github.com/junegunn/fzf#installation"
	exit 1
fi

# -- Yadm -- 
echo
if install_if_missing yadm; then
	yadm clone https://github.com/colbymorrison/dotfiles
	yadm checkout "$HOME"
	
	echo "Please choose a system type (yadm local.class)"
	YADM_CLASS=$(fzf ~/.config/bootstrap/yadm-classes)
	yadm config local.class $YADM_CLASS
fi


# -- vim-plug -- 
echo
if [ ! -f ~/.vim/autoload/plug.vim ]; then
	echo "Installing vim-plug"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim '+PlugInstall' 
fi

# -- Neovim --
echo
install_if_missing nvim neovim


echo "Complete!"
