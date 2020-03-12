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

export TERMINAL=st
