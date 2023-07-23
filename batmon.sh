#!/bin/bash

# get terminal size
SIZE=$(stty size)

# separate rows and columns
ROWS=$(echo $SIZE | cut -d' ' -f1)
COLS=$(echo $SIZE | cut -d' ' -f2)

# log file path
LOG_FILE="/var/log/bat.log"

# create a menu with dialog and get the user's choice
CHOICE=$(dialog --clear \
                --backtitle "Select a time range" \
                --title "Menu" \
                --menu "Select a range:" \
                15 40 8 \
                "1" "Last 10 minutes" \
                "2" "Last 30 minutes" \
                "3" "Last 1 hour" \
                "4" "Last 2 hours" \
                "5" "Last 6 hours" \
                "6" "Last 24 hours" \
                "7" "Last 2 days" \
                "8" "Last 7 days" \
                2>&1 >/dev/tty)

# clear the screen after the dialog
clear

# calculate the start time based on the user choice
case $CHOICE in
  1)
    START_TIME=$(date -d "-10 minutes" '+%Y-%m-%d %H:%M:%S')
    ;;
  2)
    START_TIME=$(date -d "-30 minutes" '+%Y-%m-%d %H:%M:%S')
    ;;
  3)
    START_TIME=$(date -d "-1 hour" '+%Y-%m-%d %H:%M:%S')
    ;;
  4)
    START_TIME=$(date -d "-2 hours" '+%Y-%m-%d %H:%M:%S')
    ;;
  5)
    START_TIME=$(date -d "-6 hours" '+%Y-%m-%d %H:%M:%S')
    ;;
  6)
    START_TIME=$(date -d "-24 hours" '+%Y-%m-%d %H:%M:%S')
    ;;
  7)
    START_TIME=$(date -d "-2 days" '+%Y-%m-%d %H:%M:%S')
    ;;
  8)
    START_TIME=$(date -d "-7 days" '+%Y-%m-%d %H:%M:%S')
    ;;
  *)
    echo "Invalid choice."
    exit 1
    ;;
esac

# run gnuplot with the calculated terminal size
gnuplot -e "
set terminal dumb size $COLS,$ROWS;
set datafile separator ',';
set xdata time;
set timefmt '%Y-%m-%d %H:%M:%S';
unset key;
set xrange [\"$START_TIME\":\"$(date '+%Y-%m-%d %H:%M:%S')\"];
plot '$LOG_FILE' using 1:2 with lines;
" | less
