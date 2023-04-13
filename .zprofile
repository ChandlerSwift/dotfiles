export PATH=$HOME/bin:$PATH
export HOSTNAME=`hostname`
export GOPATH=~/.local/share/go

export GOPATH=~/.local/share/go
export GOPROXY=direct
export GONOSUMDB=off

export BUILDKIT_PROGRESS=plain

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	# Enable mouse cursor for hardware interface in virtual machines
	if [[ $HOSTNAME =~ "-vm" ]]; then
		export WLR_NO_HARDWARE_CURSORS=1
	fi

	# Fix Firefox in Wayland
	export MOZ_ENABLE_WAYLAND=1
	export GDK_BACKEND=wayland

	# Save screenshots to Pictures/screenshots
	if [ ! -d "$HOME/Pictures/screenshots" ]; then
		mkdir -p "$HOME/Pictures/screenshots"
	fi
	export GRIM_DEFAULT_DIR="$HOME/Pictures/screenshots"

	# Make Swing apps work (https://github.com/xmonad/xmonad/issues/126)
	export _JAVA_AWT_WM_NONREPARENTING=1

	export XDG_CURRENT_DESKTOP=sway
	eval `ssh-agent`
	if [[ $HOSTNAME == *-vm ]]; then
		exec sway-git
	else
		exec sway
	fi
fi
