#!/bin/bash

# Issues:
#  * Creates only top-level symlinks (i.e. .foorc is fine but .foo/config
#    won't work). However, this would create recursion issues about symlinking
#    entire directories that I'm just not ready to deal with yet.

# Borrowed from https://stackoverflow.com/a/21188136
# Used so that the user doesn't have to provide absolute paths
get_abs_filename() {
	# $1 : relative filename
	echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

if [[ $# -ne 1 ]] || [[ $1 = "-h" ]] || [[ $1 = "--help" ]]; then
	echo "Usage: $0 --help"
	echo "       $0 <path to file to add>"
	echo
	echo "Moves a config file to the script's directory, and creates a symlink from its"
	echo "original location to the new location in the repository."
	exit
fi

original_location=$(get_abs_filename $1)
new_location=$(dirname $(get_abs_filename $0))

echo "Moving $original_location to $new_location."
mv $original_location $new_location

echo "Creating symlink $original_location -> $new_location."
ln -s $new_location/$(basename $1) $original_location

echo "Done! You may want to add $(basename $1) to version control."
