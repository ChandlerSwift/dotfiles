#!/bin/bash

function fix_display() {
	__fix_display --right-of
}

function fix_display_backwards() {
	__fix_display --left-of
}

function __fix_display() {
	xrandr --output VGA-1 --mode 1024x768
	xrandr --output VGA-2 --mode 1024x768
	xrandr --output VGA-1 --mode 1920x1200
	xrandr --output VGA-2 --mode 1920x1200 $1 VGA-1
}

alias k=kubectl
source <(kubectl completion zsh)

change_sub() {
	if [[ $# -ne 2 ]]; then
		cat <<EOF
Wrong number of args! Expecting 2.

Usage: change_sub current_sub new_sub
EOF
	fi
	cd $(pwd | sed "s/$1/$2/g")
}


