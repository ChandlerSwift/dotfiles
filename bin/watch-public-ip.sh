#!/bin/sh
set -euo pipefail

while true; do
        ssh root@router sh -c '". /lib/functions/network.sh; network_flush_cache; network_find_wan NET_IF; network_get_ipaddr NET_ADDR \$NET_IF; echo \$NET_ADDR"' > $HOME/.cache/public_ip
        sleep 30
done
