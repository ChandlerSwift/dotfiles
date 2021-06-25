#!/bin/sh
source $HOME/.config/backup_creds

trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

set -x
exec 2>&1

borg create ::'{hostname}-{now}' /home/chandler \
	$extra_create_args \
	--stats \
	--show-rc \
	--exclude-from /home/chandler/.borgexclude \
	--exclude-caches \
	--compression zstd

borg prune \
	--list \
	--prefix '{hostname}-' \
	--show-rc \
	--keep-daily 7 \
	--keep-weekly 4 \
	--keep-monthly 6

borg list
