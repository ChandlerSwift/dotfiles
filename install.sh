#!/bin/bash

# So far this file is not complete, but we need a no-op file in place.
exit

IGNORED_FILES="README.md LICENSE .gitignore install.sh add.sh"
IGNORED_DIRECTORIES=".git"

install_dotfile() {
	if [ -x $HOME/$dotfile ]; then
		# TODO: deal with conflicts
		# Currently this just ignores files that already exist
		return
	fi
	ln -s $1 $HOME/.$1
}

cd $(dirname "$0")

# Generate commands to ignore all files in $IGNORED_FILES # https://stackoverflow.com/a/22558474
ignore_file_string=$(printf "! -name %s " $(cat IGNORED_FILES))

# Find all config files to install
config_files=$(find . -type f $ignore_file_string)

# Install the config files!
for config_file in $config_files; do
	# mkdir -p $(dirname $config_file)
	# install_dotfile $(basename $config_file)
	echo $config_file
done


# ======================================================================

# files = find_files()
# for file in files:
#     file = "." + file
#     mkdir -p dirname(file)
#     if file is symlink:
#         pass
#     else if file is file:
#         print(file exists. [bri] <= backup, replace, ignore)
#         read; case
#     else if file does not exist:
#         ln -s
