echo *****************************
echo  MINIMIZE THIS ACTIVE PING 
echo   NetPi KEEPALIVE RUNNING! 
echo *****************************
gw="$(ip route show 0.0.0.0/0 dev wlan0 | cut -d\  -f3)"
ping $gw
