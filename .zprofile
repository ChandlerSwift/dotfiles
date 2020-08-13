export PATH=$HOME/bin:$PATH
export HOSTNAME=`hostname`

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	# Enable mouse cursor for hardware interface in virtual machines
	if [[ $HOSTNAME =~ "-vm" ]]; then
		export WLR_NO_HARDWARE_CURSORS=1
	fi

	# Fix Firefox in Wayland
	export MOZ_ENABLE_WAYLAND=1

	eval `ssh-agent`
	exec sway
fi
