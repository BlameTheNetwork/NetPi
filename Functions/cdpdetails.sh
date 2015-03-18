##
## NetPi Internet Speed Test Visual Script
## Runs on cdpd - developed by MonkeyMental.com
##

#######################################
# Define the Output as a var#
#######################################
echo Waiting for CDP Packet on ETH0
dtstamp=$(date +"%m-%d-%Y--%H%M%S")
sudo cdpr -d eth0 -v | tee /share/logs/cdp/report-$dtstamp.txt
CONTENT=$(sudo cat /share/logs/cdp/report-$dtstamp.txt)


#######################################

# HTML Content // Edit to your needs  #

#######################################

open="<html><head><title>CDP Output</title>
<style type=text/css>BODY {
color:#FFFFFF; background-color:#000000;
}</style></head>
<body><h1>NetPi CDP Details</h1><pre>"

close="</pre><br/>You may now close this window. The log was saved to the logs directory.</body></html>"


######################################

# Write content to HTML file         #

######################################

_file="/share/logs/cdp"

echo "$open" > "$_file/cdpreport.html"

echo "$CONTENT" >> "$_file/cdpreport.html"

#echo "$close" >> "$_file/cdpreport.html"


#####################################

#Open output in Dillo. Fastest load #

#####################################
chromium-browser --app=file://$_file/cdpreport.html
#dillo -f "$_file/cdpreport.html"

#####################################
