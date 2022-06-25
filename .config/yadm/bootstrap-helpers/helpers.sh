#! /bin/bash

function cmd_exists(){
	command -v "$1" >/dev/null 2>&1 
}

#
# Usage: install_if_missing command [--pkg-name pkg-name] [--pkg_manager_name-options] [--pkg_manager_name-alt] 
# 
# pkg_manager_name can be the name of any manager configured in ~/.config/bootstrap/package-manager.json
#
# Expects MANAGER and INSTALL_CMD to be set
#
function install_if_missing() {
	if [[ $# -lt 1 ]]; then
		echo "Supply a command"
		return 1
	fi

	# Hacked arg parsing. This will not work if the format from help is not followed exactly.
	# TODO use getopt to make this more robust
	CMD_NAME="$1"
	PKG="$1"
	shift 1

	OPTS=""
	ALT=""
	while true; do
		if [[ $1 == "--pkg-name" ]]; then
			PKG=$2
			shift 2
		elif [[ $1 =~ "-options" ]]; then
			mgr_options=${1/--/}
			mgr_options=${mgr_options/-options/}
			[[ $mgr_options == "$MANAGER" ]] && OPTS=$2
			shift 2
		elif [[ $1 =~ "-alt" ]]; then
			mgr_alt=${1/--/}
			mgr_alt=${mgr_alt/-alt/}
			[[ $mgr_alt == "$MANAGER" ]] && ALT=$2
			shift 2
		else
			break;
		fi
	done

	[[ "$ALT" != "" ]] && INSTALL_CMD=${INSTALL_CMD/$MANAGER/$ALT}

	if  ! cmd_exists "$CMD_NAME"; then
		echo "Installing $PKG"

		$INSTALL_CMD "$OPTS" "$PKG"

		if ! cmd_exists "$PKG"; then
			echo "Failed to install $PKG"
			return 1
		fi
	else
		echo "$PKG is already installed :)"
	fi
}
