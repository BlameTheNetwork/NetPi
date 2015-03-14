###
### NetPi LLDP Information Visual Script
### Runs on LLDPD | developed by Vincent Bernat
### vincentbernat.github.io/lldpd/
###

#######################################
# Define the LLDP Information as a var#
#######################################
DATE = $(date +"%m-%d-%Y--%H%M")
nic="eth0"
lldpdata=$(lldpctl $nic)

#######################################
# HTML Content // Edit to your needs  #
#######################################
open="<html><head><title>LLDP Output</title><style type=text/css>BODY {
color:#FFFFFF; background-color:#000000;
}</style></head><body><h1>NetPi LLDP Details</h1><pre>"
close="</pre><br/><input type='button' value='Save Report'/><input
type='button' value='New Scan'/></body></html>"

######################################
# Write content to HTML file         #
######################################
_file="/share/logs"
echo "$lldpdata" > "$_file/lldplog-$DATE.txt"
echo "$open" > "$_file/lldpreport.html"
echo "$lldpdata" >> "$_file/lldpreport.html"
echo "$close" >> "$_file/lldpreport.html"

#####################################
#Open output in Dillo. Fastest load #
#####################################
dillo -f "$_file/lldpreport.html"
#####################################
