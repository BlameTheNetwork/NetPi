###
### NetPi CDP Information Visual Script
### Blamethenetwork.com | No license, modify to fit needs
### Buy me a beer if you learned anything, or like beer.
###

#######################################
# Define the CDP Information as a var #
#######################################
nic="wlan0"
cdpdata=$(sudo cdpr -d $nic | sed 1,4d | sed '/Waiting for CDP
advertisement:/d' | sed '/transmit CDP packets/d')

#######################################
# HTML Content // Edit to your needs  #
#######################################
open="<html><head><title>CDP Output</title><style type=text/css>BODY {
color:#FFFFFF; background-color:#000000;
}</style></head><body><h1>NetPi CDP Details</h1><pre>"
close="</pre><br/><input type='button' value='Save Report'/><input
type='button' value='New Scan'/></body></html>"

######################################
# Write content to HTML file         #
######################################
_file="/home/pi/Documents/CDP"
echo "$open" > "$_file/report.html"
echo "$cdpdata" >> "$_file/report.html"
echo "$close" >> "$_file/report.html"

#####################################
#Open output in Dillo. Fastest load #
#####################################
dillo -f "$_file/report.html"
##################################
# We're done here. -Cave Johnson #
##################################

Thanks for stopping by. Check back soon for the latest updates. I'll be sure to post again around various sites once I'm complete. Shout out to the Packet Overlords in /r/networking.
