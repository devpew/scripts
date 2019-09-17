#!/bin/sh

if [ "$(pgrep openvpn)" ]; then
    echo "VPN: ON"
else
    echo "VPN: OFF"
fi
