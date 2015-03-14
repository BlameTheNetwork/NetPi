###
### NetPi Internet Speed Test Visual Script
### Runs on speedtest-cli | developed by Matt Martz
### github.com/sivel/speedtest-cli
###

#######################################
# Define the SpeedTest Output as a var#
#######################################
dtstamp=$(date +"%m-%d-%Y--%H%M")
speedtest=$(speedtest-cli | sed 1,2d)

#######################################
# HTML Content // Edit to your needs  #
#######################################
open="<html><head><title>Speed Test Output</title><style type=text/css>BODY {
color:#FFFFFF; background-color:#000000;
}</style></head><body><h1>NetPi Speed Test</h1><pre>"
close="</pre><br/><input type='button' value='Save Report'/><input
type='button' value='New Scan'/></body></html>"

######################################
# Write content to HTML file         #
######################################
_file="/share/logs/speedtest"
echo "$lldpdata" > "$_file/speedtestlog-$dtstamp.txt"
echo "$open" > "$_file/speedtestreport.html"
echo "$lldpdata" >> "$_file/speedtestreport.html"
echo "$close" >> "$_file/speedtestreport.html"

#####################################
#Open output in Dillo. Fastest load #
#####################################
dillo -f "$_file/speedtestreport.html"
#####################################
