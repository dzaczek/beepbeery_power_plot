#!/bin/bash

# path to your bat.sh script (replace with your actual path)
BAT_SCRIPT="/usr/bin/bat.sh"

# log file path
LOG_FILE="/var/log/bat.log"

# run bat.sh and capture the output
OUTPUT=$(bash "$BAT_SCRIPT")

# get the current date and time in the format required by gnuplot
# the format is 'YYYY-MM-DD hh:mm:ss'
CURRENT_DATETIME=$(date '+%Y-%m-%d %H:%M:%S')

# write datetime and output to the log file
sudo echo "$CURRENT_DATETIME,$OUTPUT" >> "$LOG_FILE"
