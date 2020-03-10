#!/bin/bash

function fix_display() {
	xrandr --output VGA-1 --mode 1024x768
	xrandr --output VGA-2 --mode 1024x768
	xrandr --output VGA-1 --mode 1920x1200
	xrandr --output VGA-2 --mode 1920x1200 --right-of VGA-1
}
