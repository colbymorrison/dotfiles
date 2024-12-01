alacritty="Alacritty"
intellij="IntelliJ IDEA"
chrome="Google Chrome"

function get_window_id(){
	aerospace list-windows --all | grep "$1" | awk '{print $1}'
}

function get_workspace_id(){
	if [[ $1 == $alacritty ]]; then
		[[ $two_monitors -eq 1 ]] && echo 1 || echo 5
	elif [[ $1 == $intellij ]]; then
		[[ $two_monitors -eq 1 ]] && echo 2 || echo 6
	elif [[ $1 == $chrome ]]; then
		[[ $two_monitors -eq 1 ]] && echo 3 || echo 7
	fi
}

function open_app(){
	if [[ $1 == $chrome ]]; then
		/opt/homebrew/Caskroom/google-chrome/116.0.5845.140/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-directory="Profile 1" &
	else
		open -a "$1"
	fi
}


if [[ $1 == "-h" || $1 == "--help" ]]; then
	echo "Moves Alactritty, IntelliJ, and Chrome to ajacent windows on the main monitor"
	echo "Usage: ./aerospace-configure.sh"
	exit 0
fi

aerospace list-monitors | grep 2 > /dev/null
two_monitors=$?
for app in "$alacritty" "$intellij" "$chrome"; do
	window_id=$(get_window_id "$app")

	if [ -z $window_id ]; then
		open_app "$app"
		sleep 2
		window_id=$(get_window_id "$app")
	fi

	if [ -z $window_id ]; then
		echo "Error opening $app"
	else
		aerospace move-node-to-workspace --window-id $window_id $(get_workspace_id "$app")
	fi

done

[[ $two_monitors -eq 1 ]] && aerospace workspace 1 || aerospace workspace 5
