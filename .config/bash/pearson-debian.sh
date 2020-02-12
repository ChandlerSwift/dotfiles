#!/bin/bash

function fix_display() {
	for i in 1 2; do
		for mode in 1024x768 1920x1200; do
			xrandr --output VGA-$i --mode $mode
		done
	done
}
