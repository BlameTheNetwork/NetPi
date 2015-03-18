##
## NetPi Internet Speed Test Visual Script
## Runs on LLDPCTL
##

#######################################
# Define the Output as a var#
#######################################
echo Working
dtstamp=$(date +"%m-%d-%Y--%H%M%S")
nic="eth0"
sudo service lldpd restart
sleep 4
sudo lldpctl eth0 | tee /share/logs/lldp/report-$dtstamp.txt
CONTENT=$(cat /share/logs/lldp/report-$dtstamp.txt)
sudo service lldpd stop

#######################################

# HTML Content // Edit to your needs  #

#######################################

open="<html><head><title>LLDP Output</title>
<style type=text/css>BODY {
color:#FFFFFF; background-color:#000000;
}</style></head>
<body><h1>NetPi LLDP Details</h1><pre>"

close="</pre><br/>You may now close this window. The log was saved to the logs directory.</body></html>"


######################################

# Write content to HTML file         #

######################################

_file="/share/logs/lldp"

echo "$open" > "$_file/lldpreport.html"

echo "$CONTENT" >> "$_file/lldpreport.html"

#echo "$close" >> "$_file/lldpreport.html"


#####################################

#Open output in Dillo. Fastest load #

#####################################
chromium-browser --app=file://$_file/lldpreport.html
#dillo -f "$_file/lldpreport.html"

#####################################
