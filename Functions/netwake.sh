# Attempts to background ping to default wlan gateway to keep WLAN device from sleeping
# Other attempts to turn off power management for WLAN appear unsuccessful. Even this script is questionable.
# Appears to be an issue with driver support on RasPis. USB ports seem to have enough power
# This is the best option for an attempted fix I can come up with.
gw="$(ip route show 0.0.0.0/0 dev wlan0 | cut -d\  -f3)"
nohup ping ${gw} &
