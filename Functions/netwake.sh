# Script improved 3/18/15 as submitted by akhepcat.
# Improvement uses default interface, and loops if no interfaces are available.
echo *****************************
echo  MINIMIZE THIS ACTIVE PING 
echo   NetPi KEEPALIVE RUNNING! 
echo *****************************
iface=$(awk 'BEGIN { IGNORECASE=1 } /^[a-z0-9]+[ \t]+00000000/ { print $1 }' /proc/net/route)
if [ -z "$iface" ]
then
  echo "no active IPv4 interface"
  sleep 4
  exit 1
fi
gw="$(ip -4 route show route default dev $iface | cut -d\  -f3)"
ping $gw
