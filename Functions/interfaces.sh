###
### NetPi Interface IP Information Visual Script
### Ifconfig tossed to a log and html file
###

#######################################
# Define the ifconfig results as a var#
#######################################
dtstamp=$(date +"%m-%d-%Y--%H%M")
intdata=$(ifconfig)

#######################################
# HTML Content // Edit to your needs  #
#######################################
open="<html><head><title>Interface Details</title><style type=text/css>BODY {
color:#FFFFFF; background-color:#000000;
}</style></head><body><h1>NetPi Interface Details</h1><pre>"
close="</pre><br/><input
type='button' value='New Scan'/></body></html>"

######################################
# Write content to HTML file         #
######################################
_file="/share/logs/interfaces"
echo "$intdata" > "$_file/intlog-$dtstamp.txt"
echo "$open" > "$_file/intreport.html"
echo "$intdata" >> "$_file/intreport.html"
echo "$close" >> "$_file/intreport.html"
echo "$intdata"

#####################################
#Open output in Dillo. Fastest load #
#####################################
dillo -f "$_file/intpreport.html"
#####################################
