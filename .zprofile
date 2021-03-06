export PATH=$HOME/bin:$PATH
export HOSTNAME=`hostname`

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	# Enable mouse cursor for hardware interface in virtual machines
	if [[ $HOSTNAME =~ "-vm" ]]; then
		export WLR_NO_HARDWARE_CURSORS=1
	fi

	# Fix Firefox in Wayland
	export MOZ_ENABLE_WAYLAND=1

	# Save screenshots to Pictures/screenshots
	if [ ! -d "$HOME/Pictures/screenshots" ]; then
		mkdir -p "$HOME/Pictures/screenshots"
	fi
	export GRIM_DEFAULT_DIR="$HOME/Pictures/screenshots"

	# Make Swing apps work (https://github.com/xmonad/xmonad/issues/126)
	export _JAVA_AWT_WM_NONREPARENTING=1

	eval `ssh-agent`
	exec sway
fi
