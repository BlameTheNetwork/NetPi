###
### NetPi Internet Speed Test Visual Script
##
# Runs on speedtest-cli | developed by Matt Martz
##
# github.com/sivel/speedtest-cli
#
##

#######################################
# Define the SpeedTest Output as a var#
#######################################
echo Working
dtstamp=$(date +"%m-%d-%Y--%H%M%S")
speedtest-cli | tee /share/logs/speedtest/report-$dtstamp.txt
CONTENT=$(cat /share/logs/speedtest/report-$dtstamp.txt)


#######################################

# HTML Content // Edit to your needs  #

#######################################

open="<html><head><title>Speed Test Output</title>
<style type=text/css>BODY {
color:#FFFFFF; background-color:#000000;
}</style></head>
<body><h1>NetPi Speed Test</h1><pre>"

close="</pre><br/>You may now close this window. The log was saved to the logs directory.</body></html>"


######################################

# Write content to HTML file         #

######################################

_file="/share/logs/speedtest"

echo "$open" > "$_file/speedtestreport.html"

echo "$CONTENT" >> "$_file/speedtestreport.html"

#echo "$close" >> "$_file/speedtestreport.html"


#####################################

#Open output in Dillo. Fastest load #

#####################################
chromium-browser --app=file://$_file/speedtestreport.html
#dillo -f "$_file/speedtestreport.html"

######################################
